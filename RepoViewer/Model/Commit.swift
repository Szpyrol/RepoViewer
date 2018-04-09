//
//  Commit.swift
//  RepoViewer
//
//  Created by Łukasz Szpyrka on 01/04/2018.
//  Copyright © 2018 Łukasz Szpyrka. All rights reserved.
//

import Foundation
import ObjectMapper

struct Commit: Mappable {

    var date: Date?
    var commiter: Commiter?
    var comment: String?

    init?(map: Map) {

    }

    mutating func mapping(map: Map) {
         date <- map["date"]
         commiter <- map["author"]
         comment <- map["message"]
    }

}
