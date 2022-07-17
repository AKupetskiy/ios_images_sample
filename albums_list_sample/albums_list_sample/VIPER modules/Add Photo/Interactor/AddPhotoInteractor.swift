//
//  AddPhotoInteractor.swift
//  albums_list_sample
//
//  Created by Andriy Kupetskyy on 6/10/19.
//  Copyright © 2019 ME. All rights reserved.
//

import Foundation

protocol AddPhotoInteractorInput: AnyObject {
    var output: AddPhotoInteractorOutput? { get set }

    func fetchAlbums()
    func createNewPhoto(name: String, album: AlbumItem)

}

protocol AddPhotoInteractorOutput: AnyObject {
    func albumsLoaded(albums: [AlbumItem])
    func albumsFailedToLoad(error: Error)

    func photoFailedToCreate(error: Error)
    func photoCreated()
}
