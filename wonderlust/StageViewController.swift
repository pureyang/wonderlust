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
    var navGrayViews: [UIImageView] = []
    
    var navButton:UIButton!
    var navGray:UIImageView!
    var scrollWidth:CGFloat = 178
    let menuItemWidth:CGFloat = 158
    let menuItemList = [
        ["newsfeedicon2x","newsfeedicongray2x"],
        ["logoicon2x","logoicongray2x"],
        ["cardicon2x","cardicongray2x"],
        ["mapicon2x","mapicongray2x"],
        ["listicon2x","listicongray2x"],]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //
        for menuItem in menuItemList{
            navButton = UIButton()
            // Following 2 lines fixes the small border region between button and its imageview
            navButton.contentHorizontalAlignment = .Fill
            navButton.contentVerticalAlignment = .Fill
            navButton.imageView?.contentMode = .ScaleAspectFit
            navButton.setImage(UIImage(named: menuItem[0])!, forState: .Normal)
            navButton.frame = CGRect(x: scrollWidth, y: 10, width: 30, height:30)
            navButton.tag = Int(scrollWidth - menuItemWidth - 19.5)
            navButton.addTarget(self, action: "navButtonTap:", forControlEvents: .TouchUpInside)

            navScrollContainer.addSubview(navButton)
            //
            navGray = UIImageView()
            navGray.image = UIImage(named: menuItem[1])!
            navGray.contentMode = .ScaleAspectFit
            navGray.frame = CGRect(x: scrollWidth, y: 10, width: 30, height:30)
            navGrayViews.append(navGray)
            navScrollContainer.addSubview(navGray)
            //
            scrollWidth += menuItemWidth
        }
        // Must set container size or button might be out of bound and not work!
        navScrollContainer.frame.size.width = scrollWidth + 40
        navScrollView.contentSize.width = scrollWidth + 40
        //
        // Move to item 1 instead of item 0
        navScrollView.contentOffset.x = menuItemWidth + 158
        
    }
    
    func navButtonTap(sender: UIButton!) {
        navScrollView.setContentOffset(CGPoint(x: sender.tag, y: 0), animated: true)
    }
    
    func scrollViewDidScroll(scrollView: UIScrollView){
        mainScrollView.contentOffset.x = scrollView.contentOffset.x*2.37 - 375*2
        var index:CGFloat = -2
        for navGray in navGrayViews{
            navGray.alpha = abs(mainScrollView.contentOffset.x/375.0 - index)
            index++
        }
    }
    
    
    func scrollViewWillEndDragging(scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        
        let scrollTarget:CGPoint = targetContentOffset.memory
        
        targetContentOffset.initialize(CGPoint(x: round(scrollTarget.x/158.5)*158.5-0.5, y:0))
    }
    
  }
