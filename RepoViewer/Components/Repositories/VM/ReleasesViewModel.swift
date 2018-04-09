//
//  ReleasesViewModel.swift
//  RepoViewer
//
//  Created by Łukasz Szpyrka on 02/04/2018.
//  Copyright © 2018 Łukasz Szpyrka. All rights reserved.
//

import Foundation
import UIKit


class ReleasesViewModel: BaseViewModel, TableViewModelProtocol {

    var releases: [Release]?
    private let repository: Repository

    required init(repo: Repository) {
        repository = repo
        super.init()
    }
    
    required init() {
        fatalError("init() has not been implemented")
    }
    func fetchData() {

        API.sharedInstance.fetchReleases(repo: repository, completed: { [weak self] error, array in
            guard let array = array else {
                self?.delegate?.refreshUI()
                self?.delegate?.showAlert(title: Constants.Errors.error, mgs: Constants.Errors.connection)
                //handle error
                return
            }
            self?.releases = array
            DispatchQueue.main.async {
                self?.delegate?.refreshUI()
            }
        })
    }

    func modelAt(index: Int) -> CellViewModelProtocol? {
        guard let releases = releases, let release = releases[index] as? CellViewModelProtocol else {
            return nil
        }
        return release
    }

    func cellIdentifier() -> String {
        return Constants.Cells.Identifiers.releasesCell
    }

    func heightOfRow() -> CGFloat {
        return 155.0
    }

    func didSelect(row: Int) {

    }

    func numberOfRows() -> Int {
        return releases?.count ?? 0
    }
    func numberOfSections() -> Int {
        return 1
    }

}
