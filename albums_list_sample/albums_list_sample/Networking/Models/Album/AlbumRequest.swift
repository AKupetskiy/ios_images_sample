//
//  AlbumRequest.swift
//  albums_list_sample
//
//  Created by Andriy Kupetskyy on 6/11/19.
//  Copyright © 2019 ME. All rights reserved.
//

import Foundation

struct AlbumsRequest: APIGETRequest {
    typealias Response = [Album]

    var resourceName: String {
        return "albums"
    }
}
