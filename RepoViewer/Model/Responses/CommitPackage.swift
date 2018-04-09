//
//  CommitPackage.swift
//  RepoViewer
//
//  Created by Łukasz Szpyrka on 07/04/2018.
//  Copyright © 2018 Łukasz Szpyrka. All rights reserved.
//

import Foundation
import ObjectMapper

struct CommitPackage: Mappable {

    var commit: Commit?

    init?(map: Map) {

    }

    mutating func mapping(map: Map) {
        commit <- map["commit"]
    }


}
