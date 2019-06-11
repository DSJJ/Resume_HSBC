//
//  ResumeContract.swift
//  Resume
//
//  Created by David Sinai Jiménez Jiménez on 6/6/19.
//  Copyright © 2019 David Jimenez. All rights reserved.
//
import UIKit
import Foundation

protocol ResumeView: class {
  var presenter: ResumePresentation! { get set }
  // Declare view methods
  func updateResumeList(resumeResults: ResumeEntity?, error: Error?)
}

protocol ResumePresentation: class {
  var view: ResumeView? { get set } //weak
  var interactor: ResumeUseCase! { get set }
  var router: ResumeWireFrame! { get set }
  func viewDidLoad()
}

protocol ResumeUseCase: class {
  var output: ResumeInteractionOutout! { get set } //weak
  // Declare use case methods
    func fetchResume()
}

protocol ResumeInteractionOutout: class {
  // Declare interactor output methods
  func didFinishFetchingResumeResults(resumeResults: ResumeEntity?, error: Error?)
}

protocol ResumeWireFrame: class {
  var viewController: UIViewController? { get set } //weak
  static func assembleModule() -> UIViewController
  // Declare wireframe methods
}
