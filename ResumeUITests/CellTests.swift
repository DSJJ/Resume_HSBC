//
//  CellTests.swift
//  ResumeUITests
//
//  Created by David Sinai Jimenez Jimenez on 6/10/19.
//  Copyright © 2019 David Jimenez. All rights reserved.
//

import XCTest

class CellTests: XCTestCase {

  let app = XCUIApplication()

  override func setUp() {
    continueAfterFailure = false
    XCUIApplication().launch()
  }

  func testNumberOfCells() {
    XCTAssertEqual(app.tables.cells.count, 13)
  }

  func testTextForFirstCell() {
    // Get fist title tu general cell
    XCTAssertEqual(app.tables.cells.staticTexts["title"].firstMatch.label, "Seller App")
  }
}
