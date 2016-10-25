//
//  FISGithubAPIClient.swift
//  github-repo-list-swift
//
//  Created by  susan lovaglio on 10/23/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

import UIKit

class GithubAPIClient {
    class func getRepositories(with completion: @escaping ([[String : Any]]) -> Void) {
        
        let urlString = "https://api.github.com/repositories?client_id=\(clientID)&client_secret=\(clientSecret)"
        
        let url = URL(string: urlString)
        
        if let url = url {
            
            let session = URLSession.shared
            
            let dataTask = session.dataTask(with: url, completionHandler: { (data, response, error) in
                
                if let unwrappedData = data {
                    
                    do {
                        
                        
                        let responseJSON = try JSONSerialization.jsonObject(with: unwrappedData, options: []) as! [[String : Any]]
                        
                        completion(responseJSON)
                        
                        
                    } catch {
                        
                        print("Oops")
                        
                    }
                    
                    
                }
            })
            
            dataTask.resume()
        
        }
    }
}

var arrayDict: [[String : AnyObject]] = [[:]]

func this() {
    GithubAPIClient.getRepositories { (repos) in
        print(repos[0]["id"])
    }
}


