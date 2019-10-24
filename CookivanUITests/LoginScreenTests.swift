//
//  LoginScreenTests.swift
//  CookivanUITests
//
//  Created by Angelina on 7/14/19.
//  Copyright © 2019 Angelina Friz. All rights reserved.
//

import XCTest

private struct LoginScreenStrings {
    static let loginButtonTitle = "ВОЙТИ"
    static let incorrectLoginAlertTitle = "Пожалуйста, заполните все поля."
    static let alertOkButton = "ОК"
}

class LoginScreenTests: XCTestCase {

    // MARK: - Properties -

    private var app: XCUIApplication { XCUIApplication() }
    private var loginButton: XCUIElement {
        self.app.buttons[LoginScreenStrings.loginButtonTitle].firstMatch
    }

    private var alert: XCUIElement {
        self.app.alerts[LoginScreenStrings.incorrectLoginAlertTitle].firstMatch
    }

    // MARK: - Setup and Teardown -

    override func setUp() {
        continueAfterFailure = false
        self.app.launch()
    }

    // MARK: - Tests -

    func test_defaultAppearance() {
        XCTAssertTrue(self.loginButton.exists)
        XCTAssertTrue(self.loginButton.isHittable)
        XCTAssertTrue(self.loginButton.isEnabled)

        XCTAssertFalse(self.alert.exists)
    }

    func test_emptyLoginAndPass() {
        self.loginButton.tap()

        XCTAssertTrue(self.alert.exists)
    }

}
