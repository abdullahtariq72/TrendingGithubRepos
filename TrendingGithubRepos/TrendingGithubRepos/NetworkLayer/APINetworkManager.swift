//
//  APIManager.swift
//  TrendingGithubRepos
//
//  Created by Abdullah Tariq on 18/05/2022.
//

import Foundation

import Alamofire
//import SwiftyJSON

class APINetworkManager{
    
    static let sharedInstance = APINetworkManager()
    
    private init(){}
    
    func requestGetData<T>(baseURL: String, params: Parameters, completion: @escaping (T?, _ error: String?)->()) where T: Codable {
        
        
        AF.request(
            baseURL,
            method: .get,
            parameters: params,
            encoding: URLEncoding.default).responseDecodable(of: T.self) { response in
                let decoder = JSONDecoder()
                if let data = response.data {
                    do {
                        let result = try decoder.decode(T.self, from: data)
                        completion(result, nil)
                    } catch{
                        completion(nil, LanguageStrings.something_went_wrong)
                    }
                }else{
                    completion(nil, LanguageStrings.something_went_wrong)
                }
            }
    }
    
}
