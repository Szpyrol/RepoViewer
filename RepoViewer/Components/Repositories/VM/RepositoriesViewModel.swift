//
//  RepositoriesViewModel.swift
//  RepoViewer
//
//  Created by Łukasz Szpyrka on 01/04/2018.
//  Copyright © 2018 Łukasz Szpyrka. All rights reserved.
//

import Foundation
import UIKit

//all 3 viewmodels could be generic class as well, at least partly

class RepositoriesViewModel: BaseRepositoryDetailsViewModel, TableViewModelProtocol {

    var repositories: [Repository]?

    func fetchData() {

        API.sharedInstance.fetchRepositories(completed: { [weak self] error, array in
            guard let array = array else {
                //handle error
                self?.delegate?.refreshUI()
                self?.delegate?.showAlert(title: Constants.Errors.error, mgs: Constants.Errors.connection)
                return
            }
            self?.repositories = array
            DispatchQueue.main.async {
                self?.delegate?.refreshUI()
            }

        })
    }

    func modelAt(index: Int) -> CellViewModelProtocol? {
        guard let repositories = repositories else {
            return nil
        }
        
        let repository = repositories[index]
        return RepositoryCellVM(repository: repository)
    }

    func cellIdentifier() -> String {
        return Constants.Cells.Identifiers.repositoryCell
    }

    func heightOfRow() -> CGFloat {
       return 70.0
    }

    func didSelect(row: Int) {
        guard let repositories = repositories else {
            return
        }
        repoDetailsDelegate?.finishWith(repo: repositories[row])
    }

    func numberOfRows() -> Int {

        return repositories?.count ?? 0
    }
    func numberOfSections() -> Int {
        return 1
    }
 
}
