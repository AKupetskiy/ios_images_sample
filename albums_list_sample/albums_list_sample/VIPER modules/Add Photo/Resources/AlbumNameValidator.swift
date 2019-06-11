//
//  AlbumNameValidator.swift
//  albums_list_sample
//
//  Created by Andriy Kupetskyy on 6/11/19.
//  Copyright © 2019 ME. All rights reserved.
//

import Foundation

struct AlbumNameValidator {
    let regex = "^[0-9a-zA-Z -_]{0,}"

    func validate(name: String) -> Bool {
        let stringTest = NSPredicate(format:"SELF MATCHES %@", regex)
        let result = stringTest.evaluate(with: name)

        return result && (name.count <= AlbumNameValidator.maxLength)
    }

    static var minLength: Int {return 8 }
    static var maxLength: Int { return 50 }
}
