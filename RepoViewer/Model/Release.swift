//
//  Release.swift
//  RepoViewer
//
//  Created by Łukasz Szpyrka on 01/04/2018.
//  Copyright © 2018 Łukasz Szpyrka. All rights reserved.
//

import Foundation
import ObjectMapper

struct Release: Mappable{

    var name: String?
    var tag: String?
    var author: Author?
    var published: Date?
    var releseNote: URL?

    init?(map: Map) {

    }

    mutating func mapping(map: Map) {
         name <- map["name"]
         tag <- map["tag"]
         author <- map["author"]
         published <- map["published"]
         releseNote <- map["releseNote"]
    }
}
