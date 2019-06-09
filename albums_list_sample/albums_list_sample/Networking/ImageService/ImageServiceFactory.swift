//
//  ImageServiceFactory.swift
//  albums_list_sample
//
//  Created by Andriy Kupetskyy on 6/9/19.
//  Copyright © 2019 ME. All rights reserved.
//

import Foundation

struct ImageServiceFactory {
    static func createService() -> ImageService {
        let apiCLient = APIClientFactory.createClient(callbackQueue: .main)
        let simpleImageService = SimpleImageService(apiClient: apiCLient)

        return simpleImageService
    }

    private init() { }
}
