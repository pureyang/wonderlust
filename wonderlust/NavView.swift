//
//  NavView.swift
//  wonderlust
//
//  Created by Carolyn Yang on 11/7/15.
//  Copyright © 2015 Yang Tang. All rights reserved.
//

import UIKit

class NavView: UIScrollView {
    
    /*
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
    // Drawing code
    }
    */
    /* Borrowing code from https://github.com/Kamaros/ELDeveloperKeyboard/blob/master/Keyboard/Custom%20Views/PredictiveTextScrollView.swift
    such that when buttons are pressed they can also be dragged UIScrollView.*/
    
    override func touchesShouldCancelInContentView(view: UIView) -> Bool{
        return view is UIButton ? true : super.touchesShouldCancelInContentView(view)
    }
}
