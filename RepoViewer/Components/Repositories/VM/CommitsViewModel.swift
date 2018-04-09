//
//  CommitsViewModel.swift
//  RepoViewer
//
//  Created by Łukasz Szpyrka on 02/04/2018.
//  Copyright © 2018 Łukasz Szpyrka. All rights reserved.
//

import Foundation
import UIKit

class CommitsViewModel: BaseViewModel, TableViewModelProtocol {

    var commits: [Commit]?
    private let repository: Repository

    required init(repo: Repository) {
        repository = repo
        super.init()
    }
    required init() {
        fatalError("init() has not been implemented")
    }

    func fetchData() {


        API.sharedInstance.fetchCommits(repo: repository, completed: { [weak self] error, array in
            guard let array = array else {
                //handle error
                self?.delegate?.refreshUI()
                self?.delegate?.showAlert(title: Constants.Errors.error, mgs: Constants.Errors.connection)
                return
            }
            self?.commits = array
            DispatchQueue.main.async {
                self?.delegate?.refreshUI()
            }
        })

    }

    func modelAt(index: Int) -> CellViewModelProtocol? {
        guard let commits = commits else {
            return nil
        }

        let commit = commits[index]
        return CommitCellVM(commit: commit)

    }

    func cellIdentifier() -> String {
        return Constants.Cells.Identifiers.commitCell
    }

    func heightOfRow() -> CGFloat {
        return UITableViewAutomaticDimension
    }

    func didSelect(row: Int) {

    }

    func numberOfRows() -> Int {
        return commits?.count ?? 0
    }
    func numberOfSections() -> Int {
        return 1
    }
}
