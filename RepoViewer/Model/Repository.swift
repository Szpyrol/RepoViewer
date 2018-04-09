//
//  Repository.swift
//  RepoViewer
//
//  Created by Łukasz Szpyrka on 01/04/2018.
//  Copyright © 2018 Łukasz Szpyrka. All rights reserved.
//

import Foundation
import ObjectMapper

struct Repository: Mappable {

    var name: String?
    var langauge: String?
    var url: String?
    var commitsUrl: String?
    var releasesUrl: String?
    var repoUrl: String?

    init?(map: Map) {

    }

    mutating func mapping(map: Map) {
        name <- map["name"]
        langauge <- map["langauge"]
        url <- map["url"]
        commitsUrl <- map["commits_url"]
        releasesUrl <- map["releases_url"]
        repoUrl <- map["url"]
    }

}
