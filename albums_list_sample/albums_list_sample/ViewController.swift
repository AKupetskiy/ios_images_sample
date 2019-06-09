//
//  ViewController.swift
//  albums_list_sample
//
//  Created by Andriy Kupetskyy on 6/8/19.
//  Copyright © 2019 ME. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let imageService = ImageServiceFactory.createService()

        imageService.getPhotos { [weak self] (result) in
            switch result {
            case .success(let photos):
                break
            case .failure(let error):
                self?.show(error)
            }
        }
    }

    //MARK: - private
    
    private func show(_ error: Error) {
        let alertController = UIAlertController(title: "Alert", message: error.localizedDescription, preferredStyle: .alert)

        let action = UIAlertAction(title: "OK", style: .default) { (action: UIAlertAction) in
        }

        alertController.addAction(action)

        present(alertController, animated: true, completion: nil)
    }
}

