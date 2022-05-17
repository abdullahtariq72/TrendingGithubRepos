//
//  Constants.swift
//  TrendingGithubRepos
//
//  Created by Abdullah Tariq on 17/05/2022.
//

import Foundation


//MARK: NIB NAME
struct NIB_NAME {
    static let shimmerCell = "ListShimmerCell"
    static let repoListTableViewCell = "RepoListTableViewCell"
}

//MARK: CELL IDENTIFIER
struct CELL_IDENTIFIER {
    static let shimmerCell = "listShimmerCell_id"
    static let repoListListCell = "repoListTableViewCell_id"
}

//MARK: STORYBOARD
struct STORYBOARD_NAME {
    static let main = StoryBoard.main.rawValue
    
}

enum StoryBoard: String {
    case main = "Main"
}
