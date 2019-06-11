//
//  AddPhotoDefaultInteractor.swift
//  albums_list_sample
//
//  Created by Andriy Kupetskyy on 6/10/19.
//  Copyright © 2019 ME. All rights reserved.
//

import Foundation

final class AddPhotoDefaultInteractor: AddPhotoInteractorInput {
    weak var output: AddPhotoInteractorOutput?

    private let imageService: ImageService

    init(imageService: ImageService) {
        self.imageService = imageService
    }

    func fetchAlbums() {
        imageService.getAlbums { [weak self] (result) in
            guard let self = self else { return }
            switch result {
            case .failure(let error):
                self.output?.albumsFailedToLoad(error: error)
            case .success(let albums):
                let items = albums.map { AlbumItem(album: $0) }
                self.output?.albumsLoaded(albums: items)
            }
        }
    }

    func createNewPhoto(name: String, album: AlbumItem) {
        imageService.createPhoto(name: name, albumId: album.id) { [weak self] (result) in
            guard let self = self else { return }
            switch result {
            case .failure(let error):
                self.output?.photoFailedToCreate(error: error)
            case .success(_):
                self.output?.photoCreated()
            }
        }
        
    }
}
