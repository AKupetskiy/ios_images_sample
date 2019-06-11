//
//  CreatePhotoRequest.swift
//  albums_list_sample
//
//  Created by Andriy Kupetskyy on 6/11/19.
//  Copyright © 2019 ME. All rights reserved.
//

import Foundation

struct CreatePhotoRequest: APIPOSTRequest {
    var headers: Dictionary<String, String> = [String: String]()
    var params: Dictionary<String, Any> = [String: Any]()

    var resourceName: String {
        return "photos"
    }


    init(name: String, albumId: Int) {
        params["title"] = name
        params["albumId"] = albumId

        headers["Content-Type"] = "application/json"
    }
}
