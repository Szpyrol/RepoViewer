//
//  ReleaseCellVM.swift
//  RepoViewer
//
//  Created by Łukasz Szpyrka on 06/04/2018.
//  Copyright © 2018 Łukasz Szpyrka. All rights reserved.
//

import Foundation

class ReleaseCellVM: BaseViewModel, CellViewModelProtocol {

    private let release: Release

    var name: String {
        return release.name ?? "Problem with release name"
    }
    var tag: String {
        return release.tag ?? ""
    }
    var authorImgUrl: String {
        return release.author?.imageUrl ?? ""
    }
    var authorLabel: String {
        return release.author?.name ?? ""
    }
    var publishDate: String {
        return "date"
    }


    required init(released: Release) {

        release = released
        super.init()
    }

    required init() {
        fatalError("init() has not been implemented")
    }
}


