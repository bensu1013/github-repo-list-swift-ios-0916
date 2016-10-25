//
//  FISReposDataStore.swift
//  github-repo-list-swift
//
//  Created by  susan lovaglio on 10/23/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

import UIKit

class ReposDataStore {
    
    static let sharedInstance = ReposDataStore()
    
    var repositories: [GithubRepository] = []
    
    func getRepositoriesFromAPI(completion: @escaping () -> () ) {
        GithubAPIClient.getRepositories { repos in
            self.repositories.removeAll()
            for repo in repos {
                self.repositories.append(GithubRepository(dictionary: repo))
            }
            completion()
        }
    }
    
}
