//
//  ImageStorageFactory.swift
//  albums_list_sample
//
//  Created by Andriy Kupetskyy on 6/10/19.
//  Copyright © 2019 ME. All rights reserved.
//

import Foundation

struct ImageStorageFactory {
    static func createStrorage(callbackQueue: DispatchQueue) -> ImageStorage {
        let urlSession = URLSession(configuration: .default)
        let storage = SimpleImageStorage(urlSession: urlSession, callbackQueue: callbackQueue)

        return storage
    }

    private init() { }
}
