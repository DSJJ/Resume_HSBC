//
//  ResumeEntity.swift
//  Resume
//
//  Created by David Sinai Jiménez Jiménez on 6/6/19.
//  Copyright © 2019 David Jimenez. All rights reserved.
//

import UIKit
import Foundation

// MARK: public struct, general object
struct ResumeEntity: Codable {
    let personalData : PersonalData?
    let profesionalCareer : [ProfesionalCareer]?
}

// MARK: public struct, sub level PersonalData
struct PersonalData : Codable {
    let name : String?
    let phone : String?
    let email : String?
    let summary : String?
    let position : String?
}

// MARK: public struct, sub level ProfesionalCareer
struct ProfesionalCareer : Codable {
    let company : String?
    let period : String?
    let position : String?
    let Projects : [Projects]?
}

// MARK: public struct, sub level Projects
struct Projects : Codable {
    let title : String?
    let detail : String?
}
