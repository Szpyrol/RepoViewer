//
//  API+Repository.swift
//  RepoViewer
//
//  Created by Łukasz Szpyrka on 02/04/2018.
//  Copyright © 2018 Łukasz Szpyrka. All rights reserved.
//

import Foundation
import Alamofire
import AlamofireObjectMapper
import ObjectMapper

extension API {

    func genericFetchingArray<T> (_ url: String, completed: @escaping (_ error: RepoViewerError?, _ repositoriesArray: [T]?) -> Void) where T: Mappable {

        Alamofire.request(Constants.API.host + Constants.API.repositories).responseArray { (response:DataResponse<[T]>) in

            switch(response.result) {
            case .success(_):
                guard let array = response.result.value else{
                    return
                }

                completed(nil, array)
                break

            case .failure(_):
                completed(.connectionProblem, nil)
                break

            }
        }

    }

    func fetchRepositories(completed: @escaping (_ error: RepoViewerError?, _ repositoriesArray: [Repository]?) -> Void) {

        Alamofire.request(Constants.API.host + Constants.API.repositories).responseArray { (response:DataResponse<[Repository]>) in

            switch(response.result) {
            case .success(_):
                guard let array = response.result.value else{
                    return
                }

                completed(nil, array)
                break

            case .failure(_):
                completed(.connectionProblem, nil)
                break

            }
        }


        }

    func fetchReleases(repo: Repository, completed: @escaping (_ error: RepoViewerError?, _ releasesArray: [Release]?) -> Void) {

        guard let repoName = repo.name else {
            completed(.connectionProblem, nil)
            return
        }
        let releasesUrl = Constants.API.repoHost + repoName + "/" + Constants.API.releases
        Alamofire.request(releasesUrl).responseArray { (response:DataResponse<[Release]>) in
            
            switch(response.result) {
            case .success(_):
                guard let array = response.result.value else{
                    return
                }

                completed(nil, array)
                break

            case .failure(_):
                completed(.connectionProblem, nil)
                break
            }
        }
    }

    func fetchCommits(repo: Repository, completed: @escaping (_ error: RepoViewerError?, _ commitsArray: [Commit]?) -> Void) {
        guard let repoName = repo.name else {
            completed(.connectionProblem, nil)
            return
        }
        let commitsUrl = Constants.API.repoHost + repoName + "/" + Constants.API.commits
        print(commitsUrl)
        Alamofire.request(commitsUrl).responseArray { (response:DataResponse<[CommitPackage]>) in

            switch(response.result) {
            case .success(_):

                guard let array = response.result.value else{
                    return
                }
                let commits: [Commit] = array.compactMap({ package in
                    if let commitJson = package.commit?.toJSON() {
                        return Commit(JSON: commitJson )
                    }
                    return nil
                })
                print(array)
                completed(nil, commits)
                break

            case .failure(_):
                completed(.connectionProblem, nil)
                break

            }
        }


    }

}
