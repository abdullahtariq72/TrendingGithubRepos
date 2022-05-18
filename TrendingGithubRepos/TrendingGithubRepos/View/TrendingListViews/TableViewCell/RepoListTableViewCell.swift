//
//  RepoListTableViewCell.swift
//  TrendingGithubRepos
//
//  Created by Abdullah Tariq on 16/05/2022.
//

import UIKit

class RepoListTableViewCell: UITableViewCell {
    
    @IBOutlet weak var mainContentView: UIView!
    @IBOutlet weak var detailsLbl: UILabel!
    @IBOutlet weak var ratingLangView: UIView!
    
    @IBOutlet weak var langColorLbl: UILabel!
    @IBOutlet weak var langLbl: UILabel!
    @IBOutlet weak var ratingLbl: UILabel!
    
    var model: SampleModel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
    }

    
    func setUpCell(){
        
        detailsLbl.text = "This is testing environment for the app"
        langLbl.text = "Javascript"
        langColorLbl.clipsToBounds = true
        langColorLbl.layer.cornerRadius = (langColorLbl.frame.size.width ) / 2
        ratingLbl.text = "121"
        
        guard let model = model else { return}
        
        if model.isExpand{
            detailsLbl.isHidden = false
            ratingLangView.isHidden = false
        }else{
            detailsLbl.isHidden = true
            ratingLangView.isHidden = true
        }
        
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
}
