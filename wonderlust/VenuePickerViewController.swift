//
//  VenuePickerViewController.swift
//  wonderlust
//
//  Created by Yang Tang on 10/23/15.
//  Copyright © 2015 Yang Tang. All rights reserved.
//

import UIKit
import Koloda
import pop

private var numberOfCards: UInt = 5

class VenuePickerViewController: UIViewController, KolodaViewDataSource, KolodaViewDelegate {

    @IBOutlet weak var kolodaView: KolodaView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        kolodaView.dataSource = self
        kolodaView.delegate = self
        
        self.modalTransitionStyle = UIModalTransitionStyle.FlipHorizontal
        
    }
    
    //MARK: KolodaViewDataSource
    func kolodaNumberOfCards(koloda: KolodaView) -> UInt {
        return numberOfCards
    }
    
    func kolodaViewForCardAtIndex(koloda: KolodaView, index: UInt) -> UIView {
        let cardImageView = UIImageView(image: UIImage(named: "Card\(index + 1)"))
        
        let tapRecognizer = UITapGestureRecognizer(target: self, action:Selector("handleTap:"))
        
        cardImageView.userInteractionEnabled = true
        cardImageView.addGestureRecognizer(tapRecognizer)
        return cardImageView
    }
    
    func kolodaViewForCardOverlayAtIndex(koloda: KolodaView, index: UInt) -> OverlayView? {
        return NSBundle.mainBundle().loadNibNamed("OverlayView",
            owner: self, options: nil)[0] as? OverlayView
    }
    
    func kolodaDidRunOutOfCards(koloda: KolodaView) {
        //Example: reloading
        kolodaView.resetCurrentCardNumber()
    }
    
    //MARK: KolodaViewDelegate
    func kolodaDidSwipedCardAtIndex(koloda: KolodaView, index: UInt, direction: SwipeResultDirection) {
        //Example: loading more cards
        if index >= numberOfCards {
            kolodaView.reloadData()
        }
    }
    
    func handleTap(recognizer: UITapGestureRecognizer) {
        self.performSegueWithIdentifier("detailSegue", sender: kolodaView.currentCardNumber)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func didTouchPin(sender: UIButton) {
        kolodaView.swipe(SwipeResultDirection.Right)
    }
    
    @IBAction func didTouchCancel(sender: UIButton) {
        kolodaView.swipe(SwipeResultDirection.Left)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let segueViewController = segue.destinationViewController as! VenueDetailViewController
        let cardnum = kolodaView.currentCardNumber
        segueViewController.cardNum = cardnum
    }
}
