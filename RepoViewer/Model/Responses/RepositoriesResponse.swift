//
//  RepositoriesResponse.swift
//  RepoViewer
//
//  Created by Łukasz Szpyrka on 05/04/2018.
//  Copyright © 2018 Łukasz Szpyrka. All rights reserved.
//

import Foundation
import ObjectMapper

struct RepositoriesResponse {
    var repositories: [Repository]?

    init?(map: Map){

    }

    mutating func mapping(map: Map) {
        repositories <- map["three_day_forecast"]
    }
}
