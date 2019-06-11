//
//  PhotosListDefaultPresenter.swift
//  albums_list_sample
//
//  Created by Andriy Kupetskyy on 6/9/19.
//  Copyright © 2019 ME. All rights reserved.
//

import Foundation

final class PhotosListDefaultPresenter: PhotosListPresenter {
    unowned var view: PhotosListViewInput
    var interactor: PhotosListInteractorInput
    var router: PhotosListRouter

    init(view: PhotosListViewInput, interactor: PhotosListInteractorInput, router: PhotosListRouter) {
        self.view = view
        self.interactor = interactor
        self.router = router
    }
}

extension PhotosListDefaultPresenter: PhotosListViewOutput {
    func viewLoaded() {
        view.setupView()
        interactor.fetchPhotos()
    }

    func createButtonPressed() {
        router.presentAddPhotoScreen()
    }
}

extension PhotosListDefaultPresenter: PhotosListInteractourOutput {
    func photosLoaded(photos: [PhotosListItem]) {
        view.display(photos: photos)
    }

    func photosFailedToLoad(error: Error) {
        view.display(error: error)
    }
}
