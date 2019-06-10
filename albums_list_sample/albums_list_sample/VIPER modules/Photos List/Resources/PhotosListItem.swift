//
//  PhotosListItem.swift
//  albums_list_sample
//
//  Created by Andriy Kupetskyy on 6/9/19.
//  Copyright © 2019 ME. All rights reserved.
//

import Foundation
import UIKit

final class PhotosListItem {
    let title: String
    let id: Int
    let albumId: Int

    let imageURL: String
    let thumbURL: String

    var onImageProvided:((UIImage?) -> Void)?
    private var image: UIImage?

    var onThumbProvided:((UIImage?) -> Void)?
    private var thumbnail: UIImage?

    init(photo: Photo) {
        self.title = photo.title
        self.id = photo.id
        self.albumId = photo.albumId

        self.imageURL = photo.url
        self.thumbURL = photo.thumbnailUrl
    }
}
