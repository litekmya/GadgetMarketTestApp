//
//  PresentstionController.swift
//  GadgetMarketTestApp
//
//  Created by Владимир Ли on 26.08.2022.
//

import UIKit

class PresentstionController: UIPresentationController {
    
    var tapGestureRecognizer = UITapGestureRecognizer()
    
    override init(presentedViewController: UIViewController, presenting presentingViewController: UIViewController?) {
        super.init(presentedViewController: presentedViewController, presenting: presentingViewController)
        tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(dismissController))
    }
    
    override var frameOfPresentedViewInContainerView: CGRect {
        guard let viewHeight = containerView?.frame.height else { return CGRect() }
        var containerHeight: CGFloat!
        
        if viewHeight > 700 {
            containerHeight = viewHeight * 0.6
        } else {
            containerHeight = viewHeight * 0.43
        }
                
        return CGRect(origin: CGPoint(x: 0, y: containerHeight),
               size: CGSize(width: containerView?.frame.width ?? 0, height: viewHeight * 0.6))
    }
    
    override func containerViewDidLayoutSubviews() {
        super.containerViewDidLayoutSubviews()
        presentedView?.frame = frameOfPresentedViewInContainerView
    }
    
    @objc private func dismissController() {
        presentedViewController.dismiss(animated: true)
    }
}
