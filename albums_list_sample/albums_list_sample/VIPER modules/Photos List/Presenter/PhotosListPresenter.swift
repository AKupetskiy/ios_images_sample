//
//  PhotosListPresenter.swift
//  albums_list_sample
//
//  Created by Andriy Kupetskyy on 6/9/19.
//  Copyright © 2019 ME. All rights reserved.
//

import Foundation

protocol PhotosListPresenter: class {

    var view: PhotosListViewInput { get set }
    var interactor: PhotosListInteractorInput { get set }
    var router: PhotosListRouter { get set }
}
