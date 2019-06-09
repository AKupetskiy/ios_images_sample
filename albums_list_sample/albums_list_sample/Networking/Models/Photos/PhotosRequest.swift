//
//  PhotosRequest.swift
//  albums_list_sample
//
//  Created by Andriy Kupetskyy on 6/9/19.
//  Copyright © 2019 ME. All rights reserved.
//

import Foundation

struct PhotosRequest: APIRequest {
    typealias Response = [Photo]

    var resourceName: String {
        return "photos"
    }
}
