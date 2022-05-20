//
//  UIView+Extension.swift
//  TrendingGithubRepos
//
//  Created by Abdullah Tariq on 17/05/2022.
//

import UIKit

extension UIView {
    
    func startShimmeringViewAnimation() {
        for animateView in getSubViewsForAnimate(view: self) {
            animateView.startShimmeringEffect()
        }
    }
    func startShimmeringEffect() {
        let light = UIColor.white.cgColor
        let alpha = UIColor(red: 206/255, green: 10/255, blue: 10/255, alpha: 0.7).cgColor
        let gradient = CAGradientLayer()
        gradient.frame = CGRect(x: -self.bounds.size.width, y: 0, width: 3 * self.bounds.size.width, height: self.bounds.size.height)
        gradient.colors = [light, alpha, light]
        gradient.startPoint = CGPoint(x: 0.0, y: 0.5)
        gradient.endPoint = CGPoint(x: 1.0,y: 0.525)
        gradient.locations = [0.35, 0.50, 0.65]
        self.layer.mask = gradient
        let animation = CABasicAnimation(keyPath: "locations")
        animation.fromValue = [0.0, 0.1, 0.2]
        animation.toValue = [0.8, 0.9,1.0]
        animation.duration = 1.25
        animation.repeatCount = HUGE
        gradient.add(animation, forKey: "shimmer")
    }
    func stopShimmingEffect(view: UIView) {
        for animateView in getSubViewsForAnimate(view: view) {
            animateView.layer.removeAllAnimations()
            animateView.layer.mask = nil
        }
    }
    func getSubViewsForAnimate(view: UIView) -> [UIView] {
        var obj: [UIView] = []
        for objView in view.subviewsRecursive() {
            obj.append(objView)
        }
        return obj.filter({ (obj) -> Bool in
            true
        })
    }
    
    func subviewsRecursive() -> [UIView] {
        return subviews + subviews.flatMap { $0.subviewsRecursive() }
    }
    
}
