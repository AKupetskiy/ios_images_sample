//
//  AddPhotoView.swift
//  albums_list_sample
//
//  Created by Andriy Kupetskyy on 6/10/19.
//  Copyright © 2019 ME. All rights reserved.
//

import Foundation

protocol AddPhotoViewInput: class {
    var output: AddPhotoViewOutput? { get }

    func show(albums: [AlbumItem])
    func show(error: Error)
    func setupView()

    func enableCreateButton()
    func disableCreateButton()

    func getSelectedAlbum() -> AlbumItem?
    func getAlbumName() -> String?
}

protocol AddPhotoViewOutput: class {
    func viewLoaded()
    func cancelButtonPressed()
    func createButtonPressed()

    func canNameBeUsed(name: String) -> Bool

    func nameChanged()
    func albumSelected()
}
