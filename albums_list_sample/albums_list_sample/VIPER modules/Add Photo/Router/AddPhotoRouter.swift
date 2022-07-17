//
//  AddPhotoRouter.swift
//  albums_list_sample
//
//  Created by Andriy Kupetskyy on 6/10/19.
//  Copyright © 2019 ME. All rights reserved.
//

import Foundation
import UIKit

protocol AddPhotoRouter: AnyObject {
    var parentController: UIViewController { get }
    func presentModule()
    func dismissModule()
}
