//
//  PlainTableViewCellTests.swift
//  CookivanTests
//
//  Created by Andrius Shiaulis on 20.10.2019.
//  Copyright © 2019 Angelina Friz. All rights reserved.
//

import XCTest
@testable import Cookivan

class PlainTableViewCellTests: XCTestCase {

    func test_plainTableViewCell_containsView() {
        let bundle = Bundle(for: PlainTableViewCell.self)

        guard (bundle.loadNibNamed("PlainTableViewCell", owner: nil)?.first as? UIView) != nil else {
          return XCTFail("PlainTableViewCell nib did not contain a UIView")
        }
    }

    func test_plainTableViewCell_containsSubviews() {
        let bundle = Bundle(for: PlainTableViewCell.self)

        guard let topMostView = bundle.loadNibNamed("PlainTableViewCell", owner: nil)?.first as? UIView else {
          return XCTFail("PlainTableViewCell nib did not contain a UIView")
        }

        guard let contentView = topMostView.subviews.first else {
            XCTFail("Content view doesn't exists")
            return
        }

        guard let containerView = contentView.subviews.first else {
            XCTFail("containerView doesn't exists")
            return
        }

        XCTAssertNotNil(containerView.subviews.first as? UIImageView)
    }

    func test_plainTableViewCell_subviewsCornerRadiuses() {
        let bundle = Bundle(for: PlainTableViewCell.self)

        guard let topMostView = bundle.loadNibNamed("PlainTableViewCell", owner: nil)?.first as? UIView else {
          return XCTFail("PlainTableViewCell nib did not contain a UIView")
        }

        guard let contentView = topMostView.subviews.first else {
            XCTFail("Content view doesn't exists")
            return
        }

        guard let containerView = contentView.subviews.first else {
            XCTFail("containerView doesn't exists")
            return
        }

        guard let imageView = containerView.subviews.first as? UIImageView else {
            XCTFail("Content view doesn't contain image view")
            return
        }

        XCTAssertEqual(containerView.layer.cornerRadius, 10)
        XCTAssertEqual(imageView.layer.cornerRadius, 10)
    }
}
