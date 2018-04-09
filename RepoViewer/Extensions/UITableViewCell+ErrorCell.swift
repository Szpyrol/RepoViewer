//
//  ErrorCell.swift
//  RepoViewer
//
//  Created by Łukasz Szpyrka on 06/04/2018.
//  Copyright © 2018 Łukasz Szpyrka. All rights reserved.
//

import Foundation
import UIKit

extension UITableViewCell {
    static func defaultCell() -> UITableViewCell {
        let errorCell = UITableViewCell(style: .default, reuseIdentifier: Constants.ViewControllers.Defaults.Identifiers.defaultCell)
        return errorCell
    }
}
