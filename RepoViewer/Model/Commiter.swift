//
//  Commiter.swift
//  RepoViewer
//
//  Created by Łukasz Szpyrka on 01/04/2018.
//  Copyright © 2018 Łukasz Szpyrka. All rights reserved.
//

import Foundation
import ObjectMapper

struct Commiter: Mappable {

    var name: String?
    var avatarUrl: String?

    init?(map: Map) {

    }

    mutating func mapping(map: Map) {
        name <- map["name"]
        avatarUrl <- map["avatarUrl"]

    }


}
