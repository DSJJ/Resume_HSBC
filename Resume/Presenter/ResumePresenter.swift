//
//  ResumePresenter.swift
//  Resume
//
//  Created by David Sinai Jiménez Jiménez on 6/6/19.
//  Copyright © 2019 David Jimenez. All rights reserved.
//

import Foundation

class ResumePresenter: ResumePresentation {
  // MARK: Properties
  weak var view: ResumeView?
  var router: ResumeWireFrame!
  var interactor: ResumeUseCase!
  func viewDidLoad() {
    interactor.fetchResume()
  }
}

extension ResumePresenter: ResumeInteractionOutout {
  // Implement interactor output methods
  func didFinishFetchingResumeResults(resumeResults: ResumeEntity?, error: Error?) {
    view?.updateResumeList(resumeResults: resumeResults, error: error)
  }
}
