//
//  MainFlowCoordinator.swift
//  RepoViewer
//
//  Created by Łukasz Szpyrka on 01/04/2018.
//  Copyright © 2018 Łukasz Szpyrka. All rights reserved.
//

import Foundation
import UIKit

class MainFlowCoordinator: FlowCoordinator {

    let configure: FlowConfigure!

    var childFlow: FlowCoordinator?
    required init(configure: FlowConfigure) {
        self.configure = configure

    }

    func start() {

        let viewModel = RepositoriesViewModel()
        let viewController = GeneralTableViewController<RepositoriesViewModel>(viewModel: viewModel)
        viewModel.repoDetailsDelegate = viewController
        viewController.delegate = self

        guard let frame = configure.window?.bounds, let navigationController = configure.navigationController else {
            return
        }
        navigationController.view.frame = frame
        navigationController.navigationBar.barTintColor = .red
        navigationController.navigationBar.tintColor = .white
        configure.navigationController?.pushViewController(viewController, animated: true)
        configure.window?.rootViewController = navigationController
        configure.window?.makeKeyAndVisible()

    }

    func startTabBarViewController(repo: Repository) {

        let tabbar = UITabBarController()
        tabbar.tabBar.barTintColor = .red
        tabbar.tabBar.tintColor = .white
        tabbar.setViewControllers([createReleaseVC(repo: repo),createCommitVC(repo: repo)], animated: true)
        configure.navigationController?.pushViewController(tabbar, animated: true)


    }
// Might be moved to generic
    func createReleaseVC(repo: Repository) -> UIViewController {

        let viewModel = ReleasesViewModel(repo: repo)
        let viewController = GeneralTableViewController<ReleasesViewModel>(viewModel: viewModel)
        viewController.tabBarItem = UITabBarItem(title: Constants.Navigation.TabBar.releases, image: nil, tag: 0)
        viewController.delegate = self
        return viewController
    }
    func createCommitVC(repo: Repository) -> UIViewController {

        let viewModel = CommitsViewModel(repo: repo)
        let viewController = GeneralTableViewController<CommitsViewModel>(viewModel: viewModel)
        viewController.tabBarItem = UITabBarItem(title: Constants.Navigation.TabBar.commits, image: nil, tag: 0)
        viewController.delegate = self
        return viewController
    }
}

extension MainFlowCoordinator: GeneralTableViewControllerDelegate {

    func didSelectCellWith(repo: Repository) {
        startTabBarViewController(repo: repo)
    }

    func didSelectCell() {

    }


}






