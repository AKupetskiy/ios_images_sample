//
//  UIViewController+DisplayError.swift
//  albums_list_sample
//
//  Created by Andriy Kupetskyy on 6/10/19.
//  Copyright © 2019 ME. All rights reserved.
//

import UIKit

protocol ErrorDisplayable {
    func display(error: Error)
}

extension UIViewController: ErrorDisplayable {
    func display(error: Error) {
        let alertController = UIAlertController(title: "Alert", message: error.localizedDescription, preferredStyle: .alert)

        let action = UIAlertAction(title: "OK", style: .default) { (action: UIAlertAction) in
        }

        alertController.addAction(action)
        present(alertController, animated: true, completion: nil)
    }
}
