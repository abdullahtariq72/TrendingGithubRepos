//
//  Constants.swift
//  TrendingGithubRepos
//
//  Created by Abdullah Tariq on 17/05/2022.
//

import Foundation
import UIKit
 
struct Constants {
    static let ErrorView = 101
    static let baseURL = "https://api.github.com/search/repositories"
    static let q = "q"
    
}


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

//MARK: FONT
struct FONT {
    static let regular = "Roboto-Regular"
    static let bold = "Roboto-Bold"
    static let light = "Roboto-Light"
    static let ultraLight = "Roboto-Thin"
    static let semiBold = "Roboto-Medium"
}

//MARK: Colors
struct Colors {
    
    static let WHITE_COLOR = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
    static let GRAY_COLOR = #colorLiteral(red: 0.7647058824, green: 0.7647058824, blue: 0.7647058824, alpha: 1)
    static let DARK_GREY = #colorLiteral(red: 0.4235294118, green: 0.4235294118, blue: 0.4235294118, alpha: 1)
    static let BLACK_COLOR = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
    
    static let FULL_BLACK_COLOR = #colorLiteral(red: 0.2, green: 0.2, blue: 0.2, alpha: 1)
    static let BORDER_COLOR = #colorLiteral(red: 0.7450980392, green: 0.7450980392, blue: 0.7450980392, alpha: 1)

    static let CHARDON_COLOR = #colorLiteral(red: 1, green: 0.9215686275, blue: 0.8666666667, alpha: 1)
    static let BLUE_COLOR = #colorLiteral(red: 0.1098039216, green: 0.2274509804, blue: 0.462745098, alpha: 1)


}
