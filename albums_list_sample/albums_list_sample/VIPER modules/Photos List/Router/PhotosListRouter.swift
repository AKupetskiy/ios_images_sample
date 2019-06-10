//
//  PhotosListRouter.swift
//  albums_list_sample
//
//  Created by Andriy Kupetskyy on 6/9/19.
//  Copyright © 2019 ME. All rights reserved.
//

import Foundation
import UIKit

protocol PhotosListRouter: class {
    func presentModule(on parentController: UIViewController)
}
