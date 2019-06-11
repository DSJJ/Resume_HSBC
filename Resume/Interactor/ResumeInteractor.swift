//
//  ResumeInteractor.swift
//  Resume
//
//  Created by David Sinai Jiménez Jiménez on 6/6/19.
//  Copyright © 2019 David Jimenez. All rights reserved.
//

import Foundation

class ResumeInteractor: ResumeUseCase {
  // MARK: Properties
  weak var output: ResumeInteractionOutout!

  // MARK: Method for obtaining data from the service
  func fetchResume() {
    
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
    
    URLSession.shared.dataTask(with: url) { data, response, error in
      
      guard error == nil,
        let data = data else {
          self.output.didFinishFetchingResumeResults(resumeResults: nil, error: error)
          return
      }

      // MARK: get data to json service
      let resumeEntity = try? JSONDecoder().decode(ResumeEntity.self, from: data)
      if let resumeEntity = resumeEntity {
        self.output.didFinishFetchingResumeResults(resumeResults: resumeEntity, error: error)
      }
      }.resume()
  }
}


