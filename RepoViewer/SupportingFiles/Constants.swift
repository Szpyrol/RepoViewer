//
//  Constants.swift
//  RepoViewer
//
//  Created by Łukasz Szpyrka on 01/04/2018.
//  Copyright © 2018 Łukasz Szpyrka. All rights reserved.
//

import Foundation

struct Constants {
    struct API {
        static let host = "https://api.github.com/orgs/comapi/"
        static let repoHost = "https://api.github.com/repos/comapi/"
        static let quickStart = "comapi-quickstarts/"

        static let repositories = "repos"
        static let commits = "commits"
        static let releases = "releases"

        struct ModelFields {
            static let name = "name"
            static let language = "language"
            static let url = "url"
        }
    }
    struct Navigation {
        struct TabBar {
            static let releases = "Releases"
            static let commits = "Commits"
        }
    }
    struct Cells {
        struct Identifiers {
            static let repositoryCell = "RepositoryTableViewCell"
            static let releasesCell   = "ReleaseTableViewCell"
            static let commitCell     = "CommitTableViewCell"
        }
    }
    struct ViewControllers {

        struct Defaults {
            struct Identifiers {
                static let defaultCell = "Default Cell"
            }
        }
    }
    struct Errors {
        static let ok = "Ok"
        static let error = "Error"
        static let noContent = "There is no content to display"
        static let connection = "There is connection problem"
        static let unknown = "There was a really strange problem which we didn't handle"
    }
}
