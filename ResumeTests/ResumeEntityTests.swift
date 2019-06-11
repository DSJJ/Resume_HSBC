//
//  ResumeEntityTests.swift
//  ResumeTests
//
//  Created by David Sinai Jiménez Jiménez on 6/7/19.
//  Copyright © 2019 David Jimenez. All rights reserved.
//

import XCTest
@testable import Resume

class ResumeEntityTests: XCTestCase {

  func testResumeEntityCodeable() {
    let testJson = """
{
  "personalData": {
    "name": "DAVID SINAI JIMÉNEZ JIMÉNEZ",
    "phone": "55 4142 9705",
    "email": "david.jimenez@globant.com",
    "summary": "Specialist in the development of native iOS applications, with the conviction of generating applications of the highest quality; In addition to having participated in all stages of the development of mobile applications, from the lifting of requirements with clients, the generation of work plans, definition of times and follow-up of these with SCRUM, up to the supervision and training of new talents in the developments. Always enjoying working for small, large and transnational companies in my more than 7 years of experience in the development of iOS applications.",
    "position": "Developer Semi Sr. Advanced iOS"
  },
  "profesionalCareer": [
    {
      "company": "Liverpool",
      "period": "Marzo 2018 – Febrero 2018",
      "position": "Sr. iOS",
      "Projects": [
        {
          "title": "Seller App",
          "detail": "Application that is used in all the Liverpool of the country, destined for the sellers in which they can charge the purchases of the articles in store and of the available online catalog for Liverpool, to consult the balances of purses among many functions that are realized in the physical point of sale. Giving more mobility to make product payments."
        }
      ]
    }
  ]
}
"""
    let jsonDecoder = JSONDecoder()
    guard let jsonData = testJson.data(using: .utf8), let resumeEntity = try? jsonDecoder.decode(ResumeEntity.self, from: jsonData) else {
      XCTFail()
      return
    }
    XCTAssertEqual(resumeEntity.personalData?.name, "DAVID SINAI JIMÉNEZ JIMÉNEZ")
    XCTAssertEqual(resumeEntity.profesionalCareer?.first?.company, "Liverpool")
    XCTAssertEqual(resumeEntity.profesionalCareer?.first?.Projects?.first?.title, "Seller App")
  }


  func testResumeEntityCodeableNilElement() {
    let testJson = """
{
  "personalData": {
    "name": "DAVID SINAI JIMÉNEZ JIMÉNEZ",
    "phone": "55 4142 9705",
    "email": "david.jimenez@globant.com",
    "summary": "Specialist in the development of native iOS applications, with the conviction of generating applications of the highest quality; In addition to having participated in all stages of the development of mobile applications, from the lifting of requirements with clients, the generation of work plans, definition of times and follow-up of these with SCRUM, up to the supervision and training of new talents in the developments. Always enjoying working for small, large and transnational companies in my more than 7 years of experience in the development of iOS applications.",
    "position": "Developer Semi Sr. Advanced iOS"
  },
  "profesionalCareer": []
}
"""
    let jsonDecoder = JSONDecoder()
    guard let jsonData = testJson.data(using: .utf8), let resumeEntity = try? jsonDecoder.decode(ResumeEntity.self, from: jsonData) else {
      XCTFail()
      return
    }
    
    XCTAssertEqual(resumeEntity.personalData?.name, "DAVID SINAI JIMÉNEZ JIMÉNEZ")
    XCTAssertNil(resumeEntity.profesionalCareer?.first?.Projects)
    XCTAssertNil(resumeEntity.profesionalCareer?.first?.Projects?.first?.title)
  }
}
