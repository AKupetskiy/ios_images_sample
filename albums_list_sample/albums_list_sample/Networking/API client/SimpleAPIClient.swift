//
//  SimpleAPIClient.swift
//  albums_list_sample
//
//  Created by Andriy Kupetskyy on 6/9/19.
//  Copyright © 2019 ME. All rights reserved.
//

import Foundation

final class SimpleAPIClient: APIClient {
    var callbackQueue: DispatchQueue

    init(urlSession: URLSession, callbackQueue: DispatchQueue) {
        self.urlSession = urlSession
        self.callbackQueue = callbackQueue
    }

    func get<T>(_ request: T, completion: @escaping (Result<T.Response, APIClientError>) -> Void) where T : APIGETRequest {
        concurrentQueue.async {
            let endpoint = self.endpoint(for: request)

            let task = self.urlSession.dataTask(with: URLRequest(url: endpoint)) { data, response, error in
                guard let response = response as? HTTPURLResponse else {
                    self.callbackQueue.async { completion(.failure(APIClientError.unknown)) }
                    return
                }

                if error != nil {
                    let message = HTTPURLResponse.localizedString(forStatusCode: response.statusCode)

                    let localizedError = APIClientError.serviceError(
                        decription: message,
                        code: response.statusCode)

                    self.callbackQueue.async { completion(.failure(localizedError)) }
                    return
                }

                guard let data = data else { completion(.failure(APIClientError.unknown)); return }

                do {
                    let response = try JSONDecoder().decode(T.Response.self, from: data)
                    self.callbackQueue.async { completion(.success(response)) }
                } catch {
                    self.callbackQueue.async { completion(.failure(APIClientError.decodingFailure)) }
                }
            }
            task.resume()
        }
    }

    func post<T>(_ request: T, completion: @escaping (Result<Void, APIClientError>) -> Void) where T : APIPOSTRequest {
        concurrentQueue.async {
            let endpoint = self.endpoint(for: request)

            let taskRequest = NSMutableURLRequest(url: endpoint)
            taskRequest.httpMethod = "POST"

            let params = request.params
            taskRequest.httpBody = try? JSONSerialization.data(withJSONObject: params, options: [])

            let headers = request.headers
            headers.forEach { header in
                taskRequest.addValue(header.value, forHTTPHeaderField: header.key)
            }


            let task = self.urlSession.dataTask(with: URLRequest(url: endpoint)) { data, response, error in
                guard let response = response as? HTTPURLResponse else {
                    self.callbackQueue.async { completion(.failure(APIClientError.unknown)) }
                    return
                }

                if error != nil {
                    let message = HTTPURLResponse.localizedString(forStatusCode: response.statusCode)

                    let localizedError = APIClientError.serviceError(
                        decription: message,
                        code: response.statusCode)

                    self.callbackQueue.async { completion(.failure(localizedError)) }
                    return
                }

                switch response.statusCode {
                case 200...226:
                    self.callbackQueue.async { completion(.success(())) }
                default:
                    let message = HTTPURLResponse.localizedString(forStatusCode: response.statusCode)

                    let localizedError = APIClientError.serviceError(
                        decription: message,
                        code: response.statusCode)

                    self.callbackQueue.async { completion(.failure(localizedError)) }
                }
            }
            task.resume()
        }
    }

    // MARK: - private

    private let urlSession: URLSession
    private let baseURL = URL(string: "https://jsonplaceholder.typicode.com/")!
    private let concurrentQueue = DispatchQueue(label: "queuename", attributes: .concurrent)

    private func endpoint<T: APIRequest>(for request: T) -> URL {
        guard let endpointURL = URL(string: request.resourceName, relativeTo: baseURL) else {
            fatalError("Bad resourceName: \(request.resourceName)")
        }

        let components = URLComponents(url: endpointURL, resolvingAgainstBaseURL: true)!
        return components.url!
    }
}
