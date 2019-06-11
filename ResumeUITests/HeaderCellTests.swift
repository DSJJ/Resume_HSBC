//
//  HeaderCellTests.swift
//  ResumeUITests
//
//  Created by David Sinai Jimenez Jimenez on 6/10/19.
//  Copyright © 2019 David Jimenez. All rights reserved.
//

import XCTest

class HeaderCellTests: XCTestCase {

  let app = XCUIApplication()

  override func setUp() {
    continueAfterFailure = false
    XCUIApplication().launch()
  }

  func testHeader() {
    XCTAssertNotNil(app.tables.staticTexts["headerCompany"])
  }

  func testTextFirstHeader() {
    XCTAssertEqual(app.tables.staticTexts["headerCompany"].firstMatch.label, "Liverpool")
  }
}
