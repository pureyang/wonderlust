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
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //
        var navButton:UIButton
        var scrollWidth:CGFloat = 20
        let menuItemWidth:CGFloat = 158
        let menuItemList = [
            ["logoicon2x","action1"],
            ["cardicon2x","action1"],
            ["mapicon2x","action1"],
            ["listicon2x","action1"],]
        for menuItem in menuItemList{
            navButton = UIButton()
            navButton.setImage(UIImage(named: menuItem[0])!, forState: .Normal)
            navButton.frame = CGRect(x: scrollWidth, y: 10, width: 30, height:30)
            navButton.tag = Int(scrollWidth - menuItemWidth - 20)
            scrollWidth += menuItemWidth
            navButton.addTarget(self, action: "navButtonTap:", forControlEvents: .TouchUpInside)

            navScrollContainer.addSubview(navButton)
        }
        // Must set container size or button might be out of bound and not work!
        navScrollContainer.frame.size.width = scrollWidth + 40
        navScrollView.contentSize.width = scrollWidth + 40
        
    }
    
    func navButtonTap(sender: UIButton!) {
        navScrollView.setContentOffset(CGPoint(x: sender.tag, y: 0), animated: true)
    }
    
    func scrollViewDidScroll(scrollView: UIScrollView){
        mainScrollView.contentOffset.x = scrollView.contentOffset.x*2.37
    }
    
    
    func scrollViewWillEndDragging(scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        let scrollTarget:CGPoint = targetContentOffset.memory
        if(scrollTarget.x<79.25){
            targetContentOffset.initialize(CGPoint(x: 0, y: 0))
        }else if(scrollTarget.x>79.25 && scrollTarget.x<237.75){                        targetContentOffset.initialize(CGPoint(x: 158.5, y: 0))
        }else{
            targetContentOffset.initialize(CGPoint(x: 317, y: 0))
        }
        
    }
    
  
    
}
