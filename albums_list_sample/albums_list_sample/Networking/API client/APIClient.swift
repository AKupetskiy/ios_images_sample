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

protocol APIRequest: Encodable {
    associatedtype Response: Decodable

    var resourceName: String { get }
}

//MARK: -

typealias ResultCallback<Value> = (Result<Value, APIClientError>) -> Void

protocol APIClient {
    var callbackQueue: DispatchQueue { get }

    func send<T: APIRequest>(_ request: T, completion: @escaping ResultCallback<T.Response>)
}
