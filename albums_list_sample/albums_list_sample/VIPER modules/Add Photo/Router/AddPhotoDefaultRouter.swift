//
//  AddPhotoDefaultRouter.swift
//  albums_list_sample
//
//  Created by Andriy Kupetskyy on 6/10/19.
//  Copyright © 2019 ME. All rights reserved.
//

import Foundation
import UIKit

final class AddPhotoDefaultRouter: AddPhotoRouter {

    let parentController: UIViewController

    init(parentController: UIViewController) {
        self.parentController = parentController
    }

    func presentModule() {
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        let view = storyboard.instantiateViewController(withIdentifier: "AddPhotoStoryboardID") as! AddPhotoViewController

        let service = ImageServiceFactory.createService()

        let interactor = AddPhotoDefaultInteractor(imageService: service)
        let presenter = AddPhotoDefaultPresenter(view: view, interactor: interactor, router: self)

        view.output = presenter
        interactor.output = presenter

        (parentController as? UINavigationController)?.pushViewController(view, animated: true)
    }

    func dismissModule() {
        (parentController as? UINavigationController)?.popViewController(animated: true)
    }
}
