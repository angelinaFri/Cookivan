//
// Created by Angelina on 2019-07-19.
// Copyright (c) 2019 Angelina Friz. All rights reserved.
//

import UIKit
import FirebaseAuth

extension UIViewController {
    func handleFireAuthError(error: Error) {
        if let errorCode = AuthErrorCode(rawValue: error._code) {
            let alertTitle = "Упс...Ошибка.\n \(errorCode.errorMessage)"
            let alert = UIAlertController(title: alertTitle, message: "", preferredStyle: .alert)
            let okAction = UIAlertAction(title: "ОК", style: .default, handler: nil)
            alert.addAction(okAction)
            self.present(alert, animated: true, completion: nil)
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
            return "Извините, что-то пошло не так. Попробуйте позже."
        }
    }
}
