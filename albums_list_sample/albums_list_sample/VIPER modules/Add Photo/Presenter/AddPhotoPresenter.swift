//
//  AddPhotoPresenter.swift
//  albums_list_sample
//
//  Created by Andriy Kupetskyy on 6/10/19.
//  Copyright © 2019 ME. All rights reserved.
//

import Foundation

protocol AddPhotoPresenter: class {

    var view: AddPhotoViewInput? { get set }
    var interactor: AddPhotoInteractorInput? { get set }
    var router: AddPhotoRouter? { get set }
}
