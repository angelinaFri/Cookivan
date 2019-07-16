//
//  Extensions.swift
//  Cookivan
//
//  Created by Angelina on 7/16/19.
//  Copyright © 2019 Angelina Friz. All rights reserved.
//

import Foundation
import UIKit
import Firebase

extension String {
    var isNotEmpty: Bool {
        return !isEmpty
    }
}

extension UIViewController {
    func simpleAlert(title: String, msg: String) {
        let alert = UIAlertController(title: title, message: msg, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "ОК", style: .default, handler: nil))
        present(alert, animated: true, completion: nil)
    }
}

extension Auth {
    func handleFireAuthError(error: Error, vc: UIViewController) {
        if let errorCode = AuthErrorCode(rawValue: error._code) {
            let alert = UIAlertController(title: "Упс...Ошибка", message: errorCode.errorMessage, preferredStyle: .alert)
            let okAction = UIAlertAction(title: "ОК", style: .default, handler: nil)
            alert.addAction(okAction)
            vc.present(alert, animated: true, completion: nil)
        }
    }
}

extension AuthErrorCode {
    var errorMessage: String {
        switch self {
        case .emailAlreadyInUse:
            return "Этот email уже используется, выберите, пожалуйста, другой."
        case .userNotFound:
            return "Данный аккаунт не найден. Проверьте и попробуйте, пожалуйста, еще раз."
        case .userDisabled:
            return "Ваш аккаунт деактивирован. Свяжитесь, пожалуйста, с отделом поддержки."
        case .invalidEmail, .invalidSender, .invalidRecipientEmail:
            return "Пожалуйста, введите правильный email."
        case .networkError:
            return "Проблема с подключением. Пожалуйста, попробуйте еще раз."
        case .weakPassword:
            return "Ваш пароль слишком легкий. Рекомендуемая длина пароля от 6 символов."
        case .wrongPassword:
            return "Неверные пароль или email."
        default:
            return "Извините, что-то пошло не так."
        }
    }
}
