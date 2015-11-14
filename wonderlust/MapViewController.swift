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
    var cardState:Int = 0
    
    let locationList = [[ "name":"Card1", "x":64, "y":358],
                        [ "name":"Card2", "x":136, "y":358],
                        [ "name":"Card3", "x":113, "y":78],
                        [ "name":"Card4", "x":236, "y":230],
                        [ "name":"Card5", "x":56, "y":130]]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        let mapImage:UIImage = UIImage(named: "Map")!
        mapImageView = UIImageView(image: mapImage)
        mapImageView.contentMode = .TopLeft
        let tapMinimize = UITapGestureRecognizer(target: self, action: "minimizeCard")
        mapImageView.addGestureRecognizer(tapMinimize)
        
        mapScroll.addSubview(mapImageView)
        mapScroll.contentSize = mapImageView.bounds.size
        mapScroll.zoomScale = 1.1
        //
        var index:Int = 0
        for buttonItem in locationList{
            let pinButton = UIButton()
            pinButton.setImage(UIImage(named: "Locationpin2x")!, forState: .Normal)
            pinButton.frame = CGRect(x: buttonItem["x"] as! Int, y: buttonItem["y"] as! Int, width: 60, height:60)
            pinButton.addTarget(self, action: "pinButtonTap:", forControlEvents: .TouchUpInside)
            pinButton.tag = index
            mapImageView.addSubview(pinButton)
            index++
        }
        mapImageView.userInteractionEnabled = true
        uiCard.contentMode = .ScaleAspectFit
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func pinButtonTap(sender:UIButton){
        let cardIndex:Int = sender.tag + 1
        let x: Int = (locationList[sender.tag]["x"] as! Int ) - 106
        let y: Int = (locationList[sender.tag]["y"] as! Int ) + 72
        if(cardState == 0){
            uiCard.image = UIImage(named: "Card\(cardIndex)")!
            mapScroll.zoomToRect(CGRect(x: x, y: y, width: 260, height: 260), animated: true)
            UIView.animateWithDuration(0.25, animations: {
                self.uiCard.transform.tx += 360
            })
            cardState = 1
        }else{
            minimizeCard()
        }
    }
    
    func minimizeCard () {
        if (cardState == 1 ) {
            UIView.animateWithDuration(0.5, animations: {
                self.mapScroll.zoomScale = 1.1
                self.uiCard.transform.tx += 360
                }, completion: {
                    (value: Bool) in
                    self.uiCard.transform.tx -= 720
                }
            )
            cardState = 0
        }
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
