//
//  FlowCoordinator.swift
//  RepoViewer
//
//  Created by Łukasz Szpyrka on 01/04/2018.
//  Copyright © 2018 Łukasz Szpyrka. All rights reserved.
//

import Foundation
import UIKit

struct FlowConfigure {
    let window: UIWindow?
    let navigationController: UINavigationController?
    let parent: FlowCoordinator?
}

protocol FlowCoordinator {
    var configure: FlowConfigure! {get}
    init(configure: FlowConfigure)
    func start()
}
