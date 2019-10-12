//
// Created by Angelina on 2019-07-19.
// Copyright (c) 2019 Angelina Friz. All rights reserved.
//

import Foundation
import FirebaseFirestore

protocol Storage {
    func createUser(withEmail: String, withPassword: String, closure: (Error?) -> Void)
}
