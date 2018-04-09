//
//  Author.swift
//  RepoViewer
//
//  Created by Łukasz Szpyrka on 01/04/2018.
//  Copyright © 2018 Łukasz Szpyrka. All rights reserved.
//

import Foundation
import ObjectMapper

struct Author: Mappable {
    
    var name: String?
    var imageUrl: String?

    init?(map: Map) {

    }

    mutating func mapping(map: Map) {
        name <- map["name"]
        imageUrl <- map["imageUrl"]
    }

}
