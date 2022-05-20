//
//  RepoListService.swift
//  TrendingGithubRepos
//
//  Created by Abdullah Tariq on 19/05/2022.
//
import Foundation
import Alamofire

class RepoListService {
    
    static var shared = RepoListService()
    
    private init(){}
    
    func getRepoListData<T>(completion: @escaping (T?, _ error: String?)->()) where T: Codable {
        
        if !NetworkReachability.isConnectedToNetwork(){
            completion(nil, LanguageStrings.something_went_wrong)
            return
        }
        
        let parameters: Parameters = [
            Constants.q : "language=+sort:stars"
        ]
        
        APINetworkManager.sharedInstance.requestGetData(baseURL: Constants.baseURL, params: parameters, completion: { (repoListResponse: T?, message: String?) in
            message == nil ? completion(repoListResponse, nil) : completion(nil, message)
        })
    }
}

