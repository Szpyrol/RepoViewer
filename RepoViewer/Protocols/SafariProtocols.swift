//
//  SafariProtocols.swift
//  RepoViewer
//
//  Created by Łukasz Szpyrka on 08/04/2018.
//  Copyright © 2018 Łukasz Szpyrka. All rights reserved.
//

import Foundation

protocol SafariOpenableCellDelegate: class {
    func openSafari(url: String)
}
protocol SafariOpenableCell: class {
    func setSafariDelegate(sd: SafariOpenableCellDelegate)
}
