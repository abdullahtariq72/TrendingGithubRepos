//
//  ListShimmerCell.swift
//  TrendingGithubRepos
//
//  Created by Abdullah Tariq on 16/05/2022.
//

import UIKit

class ListShimmerCell: UITableViewCell {
    
    
    @IBOutlet weak var imgView: UIView!
    @IBOutlet weak var nameLbl: UILabel!
    @IBOutlet weak var detailLbl: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()

        nameLbl.clipsToBounds = true
        imgView.clipsToBounds = true
        detailLbl.clipsToBounds = true
        nameLbl.layer.cornerRadius = 4.0
        detailLbl.layer.cornerRadius = 4.0
        imgView.layer.cornerRadius = (imgView.frame.size.width ) / 2
        
        self.contentView.startShimmeringViewAnimation()
        
    }
    
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    
    
}
