//
//  StoryboardHelper.swift
//  Resume
//
//  Created by David Sinai Jimenez Jimenez on 6/6/19.
//  Copyright © 2019 David Sinai Jimenez Jimenez. All rights reserved.
//

import UIKit

// MARK: - StoryboardHelper class
class StoryboardHelper {
  // MARK - Public method
  static func loadViewControllerWithIdentifier(_ identifier: String, fromStoryboard storyboardName: String) -> UIViewController? {
    let storyboard = UIStoryboard(name: storyboardName, bundle: nil)
    return storyboard.instantiateViewController(withIdentifier: identifier)
  }
}
