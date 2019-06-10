//
//  PhotosListDefaultInteractor.swift
//  albums_list_sample
//
//  Created by Andriy Kupetskyy on 6/9/19.
//  Copyright © 2019 ME. All rights reserved.
//

import Foundation

final class PhotosListDefaultInteractor: PhotosListInteractorInput {
    weak var output: PhotosListInteractourOutput?

    private let imageService: ImageService
    init(imageService: ImageService) {
        self.imageService = imageService
    }

    func fetchPhotos() {
        imageService.getPhotos { [weak self] (result) in
            guard let self = self else { return }
            switch result {
            case .failure(let error):
                self.output?.photosFailedToLoad(error: error)
            case .success(let photos):
                let items = photos.map { PhotosListItem(photo: $0) }

                self.output?.photosLoaded(photos: items)
            }
        }
    }
}
