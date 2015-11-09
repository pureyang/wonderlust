//
//  CustomOverlayView.swift
//  wonderlust
//
//  Created by Yang Tang on 11/8/15.
//  Copyright © 2015 Yang Tang. All rights reserved.
//

import UIKit
import Koloda

private let overlayRightImageName = "Cardpin"
private let overlayLeftImageName = "Cardclose"

class CustomOverlayView: OverlayView {

    @IBOutlet lazy var overlayImageView: UIImageView! = {
        [unowned self] in
        
        var imageView = UIImageView(frame: self.bounds)
        self.addSubview(imageView)
        
        return imageView
        }()
    
    override var overlayState:OverlayMode  {
        didSet {
            switch overlayState {
            case .Left :
                overlayImageView.image = UIImage(named: overlayLeftImageName)
            case .Right :
                overlayImageView.image = UIImage(named: overlayRightImageName)
            default:
                overlayImageView.image = nil
            }
            
        }
    }

}
