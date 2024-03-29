//
// Created by Angelina on 2019-07-19.
// Copyright (c) 2019 Angelina Friz. All rights reserved.
//

import Foundation
import FirebaseAuth
import Firebase

class FireBaseStorage {
    func createOrLinkUser(username: String, email: String, password: String, closure: @escaping (Error?) -> Void) {
        let checkAndCreateFirestoreUser: AuthDataResultCallback = { (result, error) in
            if let error = error {
                closure(error)
                return
            }
            guard let firestoreUser = result?.user else {
                closure((NSError(domain: "firestore user doesn't exist", code: 0, userInfo: nil)))
                return
            }
            let applicationUser = User(id: firestoreUser.uid, email: email, username: username)
            self.createFirebaseUser(user: applicationUser, closure: closure)
        }
        if let authUser = Auth.auth().currentUser {
            let credential = EmailAuthProvider.credential(withEmail: email, password: password)
            authUser.link(with: credential, completion: checkAndCreateFirestoreUser)
        } else {
            Auth.auth().createUser(withEmail: email, password: password, completion: checkAndCreateFirestoreUser)
        }
    }

    func createFirebaseUser(user: User, closure: @escaping (Error?) -> Void) {
        let newUserRef = Firestore.firestore().collection("users").document(user.id)
        let data = user.toData()
        newUserRef.setData(data) { (error) in
            if let error = error {
                debugPrint("Unable to upload new user document \(error.localizedDescription)")
            }
            closure(error)
        }
    }

    open func signIn(withEmail email: String, password: String, completion: @escaping (Result<User, Error>) -> Void) {
        Auth.auth().signIn(withEmail: email, password: password) { (result, error) in
            if let error = error {
                print("firestore error handling")
                completion(.failure(error))
            } else if let user = result?.user {
                if let email = user.email {
                    let user = User(id: user.uid, email: email, username: "")
                    print("user")
                    completion(.success(user))
                } else {
                    completion(.failure(NSError(domain: "impossible error", code: 0, userInfo: nil)))
                }
            }
        }
    }
}
