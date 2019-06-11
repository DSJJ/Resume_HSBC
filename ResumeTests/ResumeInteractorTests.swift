//
//  ResumeInteractorTests.swift
//  ResumeTests
//
//  Created by David Sinai Jimenez Jimenez on 6/10/19.
//  Copyright © 2019 David Jimenez. All rights reserved.
//

import XCTest

class ResumeInteractorTests: XCTestCase {

  func testServiceOK() {
    func testValidService() {
      var endpoint: String  {
        get {
          if let path = Bundle.main.path(forResource: "Info", ofType: "plist") {
            if let dic = NSDictionary(contentsOfFile: path) {
              return dic[Constants.URL.baseURL] as? String ?? ""
            }
          }
          return ""
        }
      }

      let url = URL(string: endpoint)!

      XCTAssertNotNil(url)

      URLSession.shared.dataTask(with: url) { data, response, error in

        guard error == nil,
          let data = data else {
            XCTFail()
            return
        }

        // MARK: get data to json service
        let resumeEntity = try? JSONDecoder().decode(ResumeEntity.self, from: data)
        if let resumeEntity = resumeEntity {
          XCTAssertNotNil(resumeEntity)
        }
        }.resume()
    }
  }

  func testServiceFail() {
    func testValidService() {

      let url = URL(string: "http://google.com.mx")!

      XCTAssertNotNil(url)

      URLSession.shared.dataTask(with: url) { data, response, error in

        guard error == nil,
          let data = data else {
            XCTFail()
            return
        }

        // MARK: get data to json service
        let resumeEntity = try? JSONDecoder().decode(ResumeEntity.self, from: data)
        XCTAssertNil(resumeEntity)
        }.resume()
    }
  }

}
