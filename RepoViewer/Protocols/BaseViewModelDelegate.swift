//
//  BaseViewModelDelegate.swift
//  RepoViewer
//
//  Created by Łukasz Szpyrka on 08/04/2018.
//  Copyright © 2018 Łukasz Szpyrka. All rights reserved.
//

import Foundation

protocol BaseViewModelDelegate: AnyObject {
    func finishVC()
    func refreshUI()
    func showAlert(title: String, mgs: String)
}
protocol RepositoryDetailsViewModelDelegate: BaseViewModelDelegate {
    func finishWith(repo: Repository)
}

class BaseViewModel {
    weak var delegate: BaseViewModelDelegate?
    required init() {

    }

}
class BaseRepositoryDetailsViewModel: BaseViewModel {
    weak var repoDetailsDelegate: RepositoryDetailsViewModelDelegate?
    required init() {

    }

}
