//
//  UILable+Extension.swift
//  TrendingGithubRepos
//
//  Created by Abdullah Tariq on 19/05/2022.
//

import Foundation
import UIKit

extension UILabel{
    
    func configureLabelWith(color: UIColor, text: String, size: CGFloat) {
        self.text = text
        textColor = color
        font = UIFont (name: FONT.regular, size: size)
    }
}
