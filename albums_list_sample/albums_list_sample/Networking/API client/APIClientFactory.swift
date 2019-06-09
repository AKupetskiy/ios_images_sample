//
//  APIClientFactory.swift
//  albums_list_sample
//
//  Created by Andriy Kupetskyy on 6/9/19.
//  Copyright © 2019 ME. All rights reserved.
//

import Foundation

struct APIClientFactory {
    static func createClient(callbackQueue: DispatchQueue) -> APIClient {

        let urlSession = URLSession(configuration: .default)
        let client = SimpleAPIClient(urlSession: urlSession, callbackQueue: callbackQueue)

        return client
    }

    private init() { }
}
