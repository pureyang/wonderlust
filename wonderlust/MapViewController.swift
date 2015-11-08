//
//  MapViewController.swift
//  wonderlust
//
//  Created by Carolyn Yang on 11/7/15.
//  Copyright © 2015 Yang Tang. All rights reserved.
//

import UIKit

class MapViewController: UIViewController, UIScrollViewDelegate{
    
    @IBOutlet weak var mapScroll: UIScrollView!
    @IBOutlet weak var uiCard: UIImageView!
    
    var mapImageView:UIImageView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        let mapImage:UIImage = UIImage(named: "Map")!
        mapImageView = UIImageView(image: mapImage)
        mapImageView.contentMode = .TopLeft
        mapScroll.addSubview(mapImageView)
        mapScroll.contentSize = mapImageView.bounds.size
        mapScroll.contentSize.width = 1000
        
        //
        let pinButton = UIButton()
        pinButton.setImage(UIImage(named: "Locationpin2x")!, forState: .Normal)
        pinButton.frame = CGRect(x: 150, y: 300, width: 60, height:60)
        pinButton.addTarget(self, action: "pinButtonTap:", forControlEvents: .TouchUpInside)
        mapImageView.addSubview(pinButton)
        mapImageView.userInteractionEnabled = true
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func pinButtonTap(sender:UIButton){
        print("test")
        mapScroll.zoomToRect(CGRect(x: 50, y: 320, width: 260, height: 260), animated: true)
        UIView.animateWithDuration(0.25, animations: {
            self.uiCard.transform.tx += 420
        })
    }
    
    func viewForZoomingInScrollView(scrollView: UIScrollView) -> UIView? {
        return mapImageView
    }
    /*
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
    // Get the new view controller using segue.destinationViewController.
    // Pass the selected object to the new view controller.
    }
    */
    
}
