//
//  GeneralTableViewController+Indicator.swift
//  RepoViewer
//
//  Created by Łukasz Szpyrka on 08/04/2018.
//  Copyright © 2018 Łukasz Szpyrka. All rights reserved.
//

import Foundation
import UIKit

extension GeneralTableViewController {
    private func initActivityIndicator() {

        indicator = UIActivityIndicatorView(frame: CGRect(x: 0, y: 0, width: 40, height: 40))
        indicator?.activityIndicatorViewStyle = UIActivityIndicatorViewStyle.gray
        indicator?.center = self.view.center

        if let indicator = indicator {
            self.view.addSubview(indicator)
        }
    }
    func startAnimatingIndicator() {

        if indicator == nil {
            initActivityIndicator()
        }
        indicator?.startAnimating()
        indicator?.backgroundColor = .white
    }
    func stopAnimatingIndicator() {
        indicator?.stopAnimating()
        indicator?.hidesWhenStopped = true
    }
}
