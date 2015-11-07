//
//  StageViewController.swift
//  wonderlust
//
//  Created by Carolyn Yang on 11/4/15.
//  Copyright © 2015 Yang Tang. All rights reserved.
//

import UIKit

class StageViewController: UIViewController,UIScrollViewDelegate {
    @IBOutlet weak var navScrollView: UIScrollView!
    @IBOutlet weak var navScrollContainer: UIView!
    
    @IBOutlet weak var mainScrollView: UIScrollView!
    var navLocation: CGPoint!
    var navOriginLocation: CGPoint!
    
    
    @IBAction func navMenuPan(panGestureRecognizer: UIPanGestureRecognizer) {
        let translation = panGestureRecognizer.translationInView(view)
        if panGestureRecognizer.state == UIGestureRecognizerState.Began {
            navLocation = navScrollContainer.center
        } else if panGestureRecognizer.state == UIGestureRecognizerState.Changed {
            if(navScrollContainer.center.x>=navOriginLocation.x){
                navScrollContainer.center = CGPoint(x: navLocation.x+translation.x, y:navLocation.y)
            }else{
                navScrollContainer.center = navOriginLocation
            }
            print(navScrollContainer.frame.minX)
        } else if panGestureRecognizer.state == UIGestureRecognizerState.Ended {
        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //
        var image:UIImage
        var imageView:UIImageView
        var scrollWidth:CGFloat = 20
        let menuItemWidth:CGFloat = 158
        let menuItemList = [["logoicon2x","action1"],
            ["cardicon2x","action1"],
            ["mapicon2x","action1"],
            ["listicon2x","action1"],]
        for menuItem in menuItemList{
            image = UIImage(named: menuItem[0])!
            imageView = UIImageView(image:image)
            imageView.contentMode = .ScaleAspectFill
            imageView.frame = CGRect(x: scrollWidth, y: 10, width: 20, height: image.size.height)
            scrollWidth += menuItemWidth
            navScrollContainer.addSubview(imageView)
        }
        navScrollView.contentSize.width = scrollWidth + 40
        
        
    }
    
    func scrollViewDidScroll(scrollView: UIScrollView){
        mainScrollView.contentOffset.x = scrollView.contentOffset.x*2.37
    }
    
    
    func scrollViewWillEndDragging(scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        let scrollTarget:CGPoint = targetContentOffset.memory
        print(scrollTarget)
        if(scrollTarget.x<79.25){
            targetContentOffset.initialize(CGPoint(x: 0, y: 0))
        }else if(scrollTarget.x>79.25 && scrollTarget.x<237.75){                        targetContentOffset.initialize(CGPoint(x: 158.5, y: 0))
        }else{
            targetContentOffset.initialize(CGPoint(x: 317, y: 0))
        }
        
    }
    
    
}
