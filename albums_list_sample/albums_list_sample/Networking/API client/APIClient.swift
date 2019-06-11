//
//  APIClient.swift
//  albums_list_sample
//
//  Created by Andriy Kupetskyy on 6/9/19.
//  Copyright © 2019 ME. All rights reserved.
//

import Foundation

//MARK: -

enum APIClientError: Error {
    case serviceError(decription: String, code: Int)
    case decodingFailure
    case unknown
}

//MARK: -

protocol APIRequest {
    var resourceName: String { get }
}

protocol APIGETRequest: APIRequest {
    associatedtype Response: Decodable
}

protocol APIPOSTRequest: APIRequest {
    var params: Dictionary<String, Any> { get }
    var headers: Dictionary<String, String> { get }
}

//MARK: -

typealias ResultCallback<Value> = (Result<Value, APIClientError>) -> Void

protocol APIClient {
    var callbackQueue: DispatchQueue { get }

    func get<T: APIGETRequest>(_ request: T, completion: @escaping ResultCallback<T.Response>)
    func post<T: APIPOSTRequest>(_ request: T, completion: @escaping ResultCallback<Void>)
}
