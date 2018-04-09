//
//  CommitCellVM.swift
//  RepoViewer
//
//  Created by Łukasz Szpyrka on 06/04/2018.
//  Copyright © 2018 Łukasz Szpyrka. All rights reserved.
//

import Foundation

class CommitCellVM: BaseViewModel, CellViewModelProtocol {

    private let _commit: Commit

    var commiterAvatarUrl: String {
        return _commit.commiter?.avatarUrl ?? ""
    }
    var commiterName: String {
        return _commit.commiter?.name ?? ""
    }
    var comment: String {
        return _commit.comment ?? ""
    }
    var date: String {
        return ""
    }
    required init(commit: Commit) {

        _commit = commit
        super.init()
    }

    required init() {
        fatalError("init() has not been implemented")
    }
}
