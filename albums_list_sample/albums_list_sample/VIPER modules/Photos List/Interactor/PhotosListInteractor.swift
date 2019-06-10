//
//  PhotosListInteractor.swift
//  albums_list_sample
//
//  Created by Andriy Kupetskyy on 6/9/19.
//  Copyright © 2019 ME. All rights reserved.
//

import Foundation

protocol PhotosListInteractorInput: class {
    var output: PhotosListInteractourOutput? { get set }

    func fetchPhotos()

}

protocol PhotosListInteractourOutput: class {
    func photosLoaded(photos: [PhotosListItem])
    func photosFailedToLoad(error: Error) 
}
