//
//  ViewModelProtocol.swift
//  RepoViewer
//
//  Created by Łukasz Szpyrka on 01/04/2018.
//  Copyright © 2018 Łukasz Szpyrka. All rights reserved.
//

import Foundation
import UIKit

protocol ViewModelProtocol {
  func numberOfRows() -> Int
  func numberOfSections() -> Int
  func heightOfRow() -> CGFloat
  func didSelect(row: Int)
    
}
protocol CellViewModelProtocol {

}
protocol TableViewModelProtocol: ViewModelProtocol {
    func cellIdentifier() -> String
    func modelAt(index: Int) -> CellViewModelProtocol?
    func fetchData()
}

