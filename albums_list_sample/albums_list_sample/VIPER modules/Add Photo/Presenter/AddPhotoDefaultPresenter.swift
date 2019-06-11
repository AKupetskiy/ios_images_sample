//
//  AddPhotoDefaultPresenter.swift
//  albums_list_sample
//
//  Created by Andriy Kupetskyy on 6/10/19.
//  Copyright © 2019 ME. All rights reserved.
//

import Foundation

final class AddPhotoDefaultPresenter: AddPhotoPresenter {
    weak var view: AddPhotoViewInput?
    var interactor: AddPhotoInteractorInput?
    var router: AddPhotoRouter?

    init(view: AddPhotoViewInput, interactor: AddPhotoInteractorInput, router: AddPhotoRouter) {
        self.view = view
        self.interactor = interactor
        self.router = router
    }

    private func validateFields() {
        let name = view?.getAlbumName()
        let album = view?.getSelectedAlbum()

        if let _name = name, album != nil {
            let nameValid = _name.count >= AlbumNameValidator.minLength
            nameValid ? view?.enableCreateButton() : view?.disableCreateButton()
        } else {
            view?.disableCreateButton()
        }
    }
}

extension AddPhotoDefaultPresenter: AddPhotoViewOutput {
    func viewLoaded() {
        view?.disableCreateButton()
        view?.setupView()
        interactor?.fetchAlbums()
    }

    func cancelButtonPressed() {
        router?.dismissModule()
    }

    func createButtonPressed() {
        let name = view?.getAlbumName()
        let album = view?.getSelectedAlbum()
        if let name = name, let album = album {
            interactor?.createNewPhoto(name: name, album: album)
        }
    }

    func canNameBeUsed(name: String) -> Bool {
        return AlbumNameValidator().validate(name: name)
    }

    func nameChanged() {
        validateFields()
    }

    func albumSelected() {
        validateFields()
    }

}

extension AddPhotoDefaultPresenter: AddPhotoInteractorOutput {
    func photoFailedToCreate(error: Error) {
        view?.show(error: error)
    }

    func photoCreated() {
        router?.dismissModule()
    }

    func albumsLoaded(albums: [AlbumItem]) {
        view?.show(albums: albums)
    }

    func albumsFailedToLoad(error: Error) {
        view?.show(error: error)
    }
}
