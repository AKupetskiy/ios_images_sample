//
//  Album.swift
//  albums_list_sample
//
//  Created by Andriy Kupetskyy on 6/11/19.
//  Copyright © 2019 ME. All rights reserved.
//

import Foundation

struct Album: Decodable {
    let userId: Int
    let id: Int
    let title: String
}
