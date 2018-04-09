//
//  RepositoryCellVM.swift
//  RepoViewer
//
//  Created by Łukasz Szpyrka on 01/04/2018.
//  Copyright © 2018 Łukasz Szpyrka. All rights reserved.
//

import Foundation

class RepositoryCellVM: BaseViewModel, CellViewModelProtocol {

    private let _repository: Repository

    var name: String {
        return _repository.name ?? "Problem with repository data"
    }
    var language: String {
        return _repository.langauge ?? ""
    }
    var url: String {
        return _repository.repoUrl ?? ""
    }

    required init(repository: Repository) {
        
        _repository = repository
        super.init()
    }
    
    required init() {
        fatalError("init() has not been implemented")
    }
}
