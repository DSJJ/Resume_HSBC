
//
//  GeneralLabesTests.swift
//  ResumeUITests
//
//  Created by David Sinai Jimenez Jimenez on 6/10/19.
//  Copyright © 2019 David Jimenez. All rights reserved.
//

import XCTest

class GeneralLabesTests: XCTestCase {

  let app = XCUIApplication()

  override func setUp() {
    continueAfterFailure = false
    XCUIApplication().launch()
  }

  func testTopLabelName() {
    XCTAssertTrue(app.staticTexts["labelName"].exists)
  }

  func testTextTopLabelName() {
    XCTAssertEqual(app.staticTexts["labelName"].label, "DAVID SINAI JIMÉNEZ JIMÉNEZ")
  }

  func testTopLabelPosition() {
    XCTAssertTrue(app.staticTexts["labelPosition"].exists)
  }

  func testTextTopLabelPosition() {
    XCTAssertEqual(app.staticTexts["labelPosition"].label, "Developer Semi Sr. Advanced iOS")
  }


}
