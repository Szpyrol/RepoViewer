//
//  RepoViewerErrors.swift
//  RepoViewer
//
//  Created by Łukasz Szpyrka on 06/04/2018.
//  Copyright © 2018 Łukasz Szpyrka. All rights reserved.
//

import Foundation

enum RepoViewerError: Error {
    case connectionProblem
    case noContent
    case unknown
}

struct RepoViewerErrorManager {
    static func errorMessage(error: RepoViewerError) -> String {
        switch error {
        case .connectionProblem:
            return Constants.Errors.connection
        case .noContent:
            return Constants.Errors.noContent
        default:
            return Constants.Errors.unknown
        }
    }
}
