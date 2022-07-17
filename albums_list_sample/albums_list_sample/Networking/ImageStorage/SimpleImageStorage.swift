//
//  SimpleImageStorage.swift
//  albums_list_sample
//
//  Created by Andriy Kupetskyy on 6/10/19.
//  Copyright © 2019 ME. All rights reserved.
//

import Foundation
import UIKit

final class SimpleImageStorage: ImageStorage {
    let callbackQueue: DispatchQueue
    let urlSession: URLSession

    private let downloadQueue = DispatchQueue(label: "SimpleImageStorage_download_queue", attributes: .concurrent)
    private var cache = NSCache<NSString, UIImage>()

    init(urlSession: URLSession, callbackQueue: DispatchQueue = .main) {
        self.callbackQueue = callbackQueue
        self.urlSession = urlSession
    }

    func provideImage(_ imageURL: String, completion: @escaping (Result<(url: String, image: UIImage?), ImageStorageError>) -> Void) {
        downloadQueue.async {
            if let image = self.getImage(for: imageURL) {
                self.callbackQueue.async {
                    completion(.success((url: imageURL, image: image)))
                }
                return
            }

            guard let url = URL(string: imageURL) else {
                self.callbackQueue.async { completion(.failure(.invalidParams)) }
                return
            }

            let task = self.urlSession.downloadTask(with: url, completionHandler: { (url, response, error) in
                guard let response = response as? HTTPURLResponse else {
                    self.callbackQueue.async { completion(.failure(.unknown)) }
                    return
                }

                if let error = error {
                    self.callbackQueue.async { completion(.failure(.networkError(decription: error.localizedDescription, code: response.statusCode))) }
                    return
                }

                guard let url = url, let data = try? Data.init(contentsOf: url), let downloadedImage = UIImage.init(data: data) else {
                    self.callbackQueue.async { completion(.failure(.invalidResponse)) }
                    return
                }

                self.saveImage(image: downloadedImage, for: imageURL)
                self.callbackQueue.async {
                    completion(.success( (url: imageURL, image: downloadedImage) ))
                }

            })
            task.resume()
        }

    }

    // MARK: - private

    private func getImage(for urlString: String) -> UIImage? {
        return self.cache.object(forKey: urlString as NSString)
    }

    private func saveImage(image: UIImage, for urlString: String) {
        self.cache.setObject(image, forKey: urlString as NSString)
    }

}
