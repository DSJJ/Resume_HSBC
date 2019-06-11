//
//  ResumeRouter.swift
//  Resume
//
//  Created by David Sinai Jiménez Jiménez on 6/6/19.
//  Copyright © 2019 David Jimenez. All rights reserved.
//

import Foundation
import UIKit

class ResumeRouter: ResumeWireFrame {
  // MARK: Properties
  weak var viewController: UIViewController?
  // MARK: Static methods
  static func assembleModule() -> UIViewController {
    let viewController = StoryboardHelper.loadViewControllerWithIdentifier(Constants.ViewControllerIdentifier.mainResumeViewControllerIdentifier, fromStoryboard: Constants.Storyboard.mainStoryboard) as! ResumeViewController
    let presenter = ResumePresenter()
    let router = ResumeRouter()
    let interactor = ResumeInteractor()

    viewController.presenter =  presenter

    presenter.view = viewController as ResumeView
    presenter.router = router
    presenter.interactor = interactor

    router.viewController = viewController

    interactor.output = presenter

    return viewController
  }
}
