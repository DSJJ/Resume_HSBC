//
//  ResumeViewController.swift
//  Resume
//
//  Created by David Sinai Jiménez Jiménez on 6/6/19.
//  Copyright © 2019 David Jimenez. All rights reserved.
//

import UIKit
import Foundation

class ResumeViewController: UIViewController {

  // MARK: Properties
  var presenter: ResumePresentation!
  var resumeData: ResumeEntity?
  
  @IBOutlet weak var name: UILabel!
  @IBOutlet weak var position: UILabel!
  @IBOutlet weak var phone: UILabel!
  @IBOutlet weak var email: UILabel!
  
  @IBOutlet weak var tableView: UITableView!
  
  // MARK: Lifecycle
  override func viewDidLoad() {
    super.viewDidLoad()
    presenter.viewDidLoad()
    setupView()
  }

  fileprivate func setupView() {
    tableView?.estimatedRowHeight = 73
    tableView?.rowHeight = UITableView.automaticDimension
  }
}

extension ResumeViewController: ResumeView {
  // implement view output methods
  func updateResumeList(resumeResults: ResumeEntity?, error: Error?) {
    guard let resumeResults = resumeResults else { return }
    resumeData = resumeResults
    DispatchQueue.main.async { [weak self] in
      // update elementes
      self?.name.text = self?.resumeData?.personalData?.name ?? ""
      self?.position.text = self?.resumeData?.personalData?.position ?? ""
      self?.phone.text = self?.resumeData?.personalData?.phone ?? ""
      self?.email.text = self?.resumeData?.personalData?.email ?? ""
      self?.tableView.reloadData()
    }
  }
}

// MARK:- UITableView delegate and datasource
extension ResumeViewController: UITableViewDelegate, UITableViewDataSource {
  
  func numberOfSections(in tableView: UITableView) -> Int {
    return resumeData?.profesionalCareer?.count ?? 0
  }
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return resumeData?.profesionalCareer?[section].Projects?.count ?? 0
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: Constants.CellIdentifier.generalCell, for: indexPath) as! ResumeCell
    cell.titel.text = resumeData?.profesionalCareer?[indexPath.section].Projects?[indexPath.row].title ?? ""
    cell.detail.text = resumeData?.profesionalCareer?[indexPath.section].Projects?[indexPath.row].detail ?? ""
    cell.selectionStyle = .none
    return cell
  }
  
  func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
    let header = tableView.dequeueReusableCell(withIdentifier: Constants.CellIdentifier.headerCell) as! ResumeHeaderCell
    header.company.text = resumeData?.profesionalCareer?[section].company ?? ""
    header.period.text = resumeData?.profesionalCareer?[section].period ?? ""
    header.position.text = resumeData?.profesionalCareer?[section].position ?? ""
    return header
  }
}
