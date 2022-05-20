//
//  GihubRepoPresenter.swift
//  TrendingGithubRepos
//
//  Created by Abdullah Tariq on 16/05/2022.
//

import Foundation

//MARK: - RepoList Delgate Method
protocol RepoListViewDelegate: NSObjectProtocol {
    func displayRepoData(model: GithubReposListModel?, msg: String?)
}

class GithubRepoPresenter {
    
    //MARK: - Data Members
    private let repoListService: RepoListService?
    weak var repoListViewDelegate : RepoListViewDelegate?
    
    //MARK: - Presenter init()
    init(repoListService: RepoListService){
        self.repoListService = repoListService
    }
    
    //MARK: - API hit to get the list
    func fetchGitRepoList(){
        RepoListService.shared.getRepoListData(completion: { [weak self] (repoListResponse: GithubReposListModel?, message: String?) in
            if let dataModel = repoListResponse{
                self?.repoListViewDelegate?.displayRepoData(model: dataModel, msg: nil)
            }else{
                self?.repoListViewDelegate?.displayRepoData(model: nil, msg: message ?? "")
            }
            
        })
    }
}
