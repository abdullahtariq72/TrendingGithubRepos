//
//  UIViewController+Extension.swift
//  TrendingGithubRepos
//
//  Created by Abdullah Tariq on 19/05/2022.
//

import Foundation
import UIKit
import Lottie
extension UIViewController {
    
    func showErrorView(retryCompletion: @escaping () -> ()){
        
        let mainView: UIView = {
            let view = UIView(frame: CGRect(x: 0, y: 0, width: self.view.frame.width, height: self.view.frame.height))
            view.tag = Constants.ErrorView
            return view
        }()
        
        let subView: UIView = {
            let view = UIView()
            
            mainView.addSubview(view)
            view.translatesAutoresizingMaskIntoConstraints = false
            
            NSLayoutConstraint.activate([
                view.heightAnchor.constraint(equalToConstant: 400),
                view.widthAnchor.constraint(equalToConstant: 300),
                view.centerXAnchor.constraint(equalTo: mainView.centerXAnchor),
                view.centerYAnchor.constraint(equalTo: mainView.centerYAnchor)
            ])
            
            return view
        }()
        
        let gifView : AnimationView = {
            let gifView = AnimationView()
            let animation = Animation.named("retry")
            gifView.contentMode = .scaleAspectFill
            gifView.animation = animation
            gifView.loopMode = .loop
            gifView.play()
            subView.addSubview(gifView)
            gifView.translatesAutoresizingMaskIntoConstraints = false
            
            NSLayoutConstraint.activate([
                gifView.heightAnchor.constraint(equalToConstant: 300),
                gifView.widthAnchor.constraint(equalToConstant: 300),
                gifView.centerXAnchor.constraint(equalTo: subView.centerXAnchor),
            ])
            
            return gifView
        }()
        
        let _: UIStackView = {
            let stackView = UIStackView()
            stackView.axis  = NSLayoutConstraint.Axis.vertical
            stackView.distribution  = UIStackView.Distribution.fill
            stackView.alignment = UIStackView.Alignment.center
            stackView.spacing = 5.0
            
            let labelError = UILabel()
            labelError.configureLabelWith(color: .label, text: LanguageStrings.something_went_wrong, size: 18)
            
            let labelErrorDetail = UILabel()
            labelErrorDetail.configureLabelWith(color: .secondaryLabel, text: LanguageStrings.blocking_your_signal, size: 14)
            stackView.addArrangedSubview(labelError)
            stackView.addArrangedSubview(labelErrorDetail)
            
            subView.addSubview(stackView)
            stackView.translatesAutoresizingMaskIntoConstraints = false
            
            NSLayoutConstraint.activate([
                
                stackView.heightAnchor.constraint(equalToConstant: 60),
                stackView.topAnchor.constraint(equalTo: gifView.bottomAnchor, constant: 20),
                stackView.leadingAnchor.constraint(equalTo: subView.leadingAnchor, constant: 10),
                stackView.trailingAnchor.constraint(equalTo: subView.trailingAnchor, constant: -10),
            ])
            
            return stackView
            
        }()
        
        let _: UIButton = {
            let button = UIButton()
            button.clipsToBounds = true
            button.layer.cornerRadius = 4.0
            button.layer.borderWidth = 1.0
            button.layer.borderColor = UIColor.systemGreen.cgColor
            button.setTitleColor(.systemGreen, for: .normal)
            button.setTitle(LanguageStrings.retry, for: .normal)
            button.addAction {
                retryCompletion()
            }
            mainView.addSubview(button)
            button.translatesAutoresizingMaskIntoConstraints = false
            
            NSLayoutConstraint.activate([
                button.heightAnchor.constraint(equalToConstant: 40),
                button.leadingAnchor.constraint(equalTo: mainView.leadingAnchor, constant: 10),
                button.trailingAnchor.constraint(equalTo: mainView.trailingAnchor, constant: -10),
                button.bottomAnchor.constraint(equalTo: mainView.safeAreaLayoutGuide.bottomAnchor, constant: -10)
            ])
            return button
        }()
        
        self.view.addSubview(mainView)

    }
    func hideErrorView(){
        if let viewWithTag = self.view.viewWithTag(Constants.ErrorView) {
            viewWithTag.removeFromSuperview()
        }
    }
}
