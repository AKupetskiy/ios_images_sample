//
//  AddPhotoItem.swift
//  albums_list_sample
//
//  Created by Andriy Kupetskyy on 6/10/19.
//  Copyright © 2019 ME. All rights reserved.
//

import Foundation

struct AlbumItem {
    let id: Int
    let title: String

    init(album: Album) {
        self.id = album.id
        self.title = album.title
    }
}
