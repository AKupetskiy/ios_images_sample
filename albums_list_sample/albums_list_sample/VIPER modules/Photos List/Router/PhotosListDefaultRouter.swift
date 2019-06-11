//
//  PhotosListDefaultRouter.swift
//  albums_list_sample
//
//  Created by Andriy Kupetskyy on 6/9/19.
//  Copyright © 2019 ME. All rights reserved.
//

import Foundation
import UIKit

final class PhotosListDefaultRouter: PhotosListRouter {

    let parentController: UIViewController

    init(parentController: UIViewController) {
        self.parentController = parentController
    }

    func presentAddPhotoScreen() {
        let addPhotoRouter = AddPhotoDefaultRouter(parentController: parentController)
        addPhotoRouter.presentModule()
    }

    func presentModule() {
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        let view = storyboard.instantiateViewController(withIdentifier: "PhotosListStoryboardID") as! PhotosListViewController

        let service = ImageServiceFactory.createService()
        let storage = ImageStorageFactory.createStrorage(callbackQueue: .main)

        let interactor = PhotosListDefaultInteractor(imageService: service, imageStorage: storage)
        
        let presenter = PhotosListDefaultPresenter(view: view, interactor: interactor, router: self)

        view.output = presenter
        interactor.output = presenter

        (parentController as? UINavigationController)?.pushViewController(view, animated: false)
    }

}
