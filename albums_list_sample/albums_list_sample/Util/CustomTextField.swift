//
//  CustomTextField.swift
//  albums_list_sample
//
//  Created by Andriy Kupetskyy on 6/11/19.
//  Copyright © 2019 ME. All rights reserved.
//

import UIKit

class CustomTextField: UITextField {

    override func canPerformAction(_ action: Selector, withSender sender: Any?) -> Bool {
        OperationQueue.main.addOperation {
            UIMenuController.shared.setMenuVisible(false, animated: false)
        }

        return super.canPerformAction(action, withSender: sender)
    }

}
