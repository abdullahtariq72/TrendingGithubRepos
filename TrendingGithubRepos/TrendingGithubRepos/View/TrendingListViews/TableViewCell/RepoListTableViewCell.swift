//
//  RepoListTableViewCell.swift
//  TrendingGithubRepos
//
//  Created by Abdullah Tariq on 16/05/2022.
//

import UIKit

class RepoListTableViewCell: UITableViewCell {
    
    
    //MARK: - IBOutlets
    @IBOutlet weak var avatarImgView: UIImageView!
    @IBOutlet weak var userNameLbl: UILabel!
    @IBOutlet weak var repoNameLbl: UILabel!
    @IBOutlet weak var repoDetailsLbl: UILabel!
    @IBOutlet weak var langColorLbl: UILabel!
    @IBOutlet weak var languageLbl: UILabel!
    @IBOutlet weak var ratingImgView: UIImageView!
    @IBOutlet weak var ratingLbl: UILabel!
    @IBOutlet weak var ratingLangView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        repoDetailsLbl.isHidden = true
        ratingLangView.isHidden = true
    }
    
    //MARK: - resetting up color for dark or light mode
    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        super.traitCollectionDidChange(previousTraitCollection)
        setColors()
    }
    
    
    //MARK: - setting up cell views
    func setUpCell(dataItem: Item){
        setupViews(dataItem)
        dataItem.isExpanded ? showExpandedView() : hideExpandedView()
    }
    
    
    //MARK: - setting up subviews views
    func setupViews(_ item: Item){
        setColors()
        avatarImgView.clipsToBounds = true
        avatarImgView.layer.borderWidth = 2.0
        avatarImgView.layer.cornerRadius = (avatarImgView.frame.size.width ) / 2
        avatarImgView.loadRemoteImageFrom(urlString: item.owner?.avatarURL ?? "")
        userNameLbl.configureLabelWith(color: .label, text: item.owner?.login ?? "", size: 14)
        repoNameLbl.configureLabelWith(color: .label, text: item.name ?? "", size: 16)
        repoDetailsLbl.configureLabelWith(color: .label, text: item.itemDescription ?? "", size: 12)
        languageLbl.configureLabelWith(color: .label, text: item.language ?? "", size: 10)
        ratingLbl.configureLabelWith(color: .label, text: String(item.stargazersCount ?? 0), size: 10)
        ratingImgView.image = UIImage(named: "rate-star")!.withRenderingMode(.alwaysTemplate)
        ratingImgView.tintColor = .systemYellow
        langColorLbl.clipsToBounds = true
        langColorLbl.backgroundColor = Colors.BLUE_COLOR
        langColorLbl.layer.cornerRadius = (langColorLbl.frame.size.width ) / 2
        
    }
    
    //MARK: - setting up colors
    func setColors(){
        avatarImgView.layer.borderColor =
        UIColor { traitCollection in
            switch traitCollection.userInterfaceStyle {
            case .dark:
                return Colors.WHITE_COLOR
            default:
                return Colors.FULL_BLACK_COLOR
            }
        }.cgColor
    }
    
    //MARK: - toggle expanded and unexpanded view
    func showExpandedView() {
        repoDetailsLbl.isHidden = false
        ratingLangView.isHidden = false
    }
    
    func hideExpandedView() {
        repoDetailsLbl.isHidden = true
        ratingLangView.isHidden = true
    }
}

