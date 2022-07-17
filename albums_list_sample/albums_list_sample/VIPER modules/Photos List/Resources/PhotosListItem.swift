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

    let thumbURL: String

    weak var storage: ImageStorage?

    var onThumbProvided:((UIImage?) -> Void)?
    private var thumbnail: UIImage?

    init(photo: Photo, storage: ImageStorage? = nil) {
        self.title = photo.title
        self.id = photo.id
        self.albumId = photo.albumId
        self.thumbURL = photo.thumbnailUrl
        self.storage = storage
    }

    func downloadImage() {
        if let thumbnail = thumbnail {
            onThumbProvided?(thumbnail)
            return
        }

        storage?.provideImage(thumbURL) { [weak self] result in
			guard let self = self, case .success(let tuple) = result else {
				return
			}
			// check if image is for corrent item
			if self.thumbURL == tuple.url {
				self.thumbnail = tuple.image
				self.onThumbProvided?(tuple.image)
			}
		}
	}
}
