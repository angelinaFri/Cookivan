//
//  User.swift
//  Cookivan
//
//  Created by Angelina on 7/16/19.
//  Copyright © 2019 Angelina Friz. All rights reserved.
//

import Foundation

struct User {
    var id: String
    var email: String
    var username: String

    init(id: String = "",
         email: String = "",
         username: String = "") {

        self.id = id
        self.email = email
        self.username = username
    }
    // TODO:- Recheck when I need this initializer
    init(data: [String: Any]) {
        id = data["id"] as? String ?? ""
        email = data["email"] as? String ?? ""
        username = data["username"] as? String ?? ""
     }

    static func modelToData(user: User) -> [String: Any] {
        let data: [String: Any] = [
            "id": user.id,
            "email": user.email,
            "username": user.username ]
        return data
    }
}




