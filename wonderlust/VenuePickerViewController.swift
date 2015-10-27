//
//  VenuePickerViewController.swift
//  wonderlust
//
//  Created by Yang Tang on 10/23/15.
//  Copyright © 2015 Yang Tang. All rights reserved.
//

import UIKit

class VenuePickerViewController: UIViewController {

    var isMenuExpanded = false

    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var pickerView: UIView!
    
    @IBOutlet weak var place1ImageView: UIImageView!
    @IBOutlet weak var place1DetailImageView: UIImageView!
    
    var pickerViewOriginalCenter: CGPoint!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        pickerViewOriginalCenter = pickerView.center
        
        scrollView.contentSize = CGSize(width: place1ImageView.image!.width, height: place1ImageView.image!.height+place1DetailImageView.image!.height)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

    @IBAction func onMenuTap(sender: AnyObject) {
        
        if (!isMenuExpanded) {
            // collapse menu
            UIView.animateWithDuration(0.3, animations: { () -> Void in
                self.pickerView.center = CGPoint(x: self.pickerViewOriginalCenter.x+100, y: self.pickerViewOriginalCenter.y)
                }, completion: { (finished) -> Void in
                    self.isMenuExpanded = true;
            })
        } else {
            // animate menu out
            UIView.animateWithDuration(0.3, animations: { () -> Void in
                self.pickerView.center = CGPoint(x: self.pickerViewOriginalCenter.x, y: self.pickerViewOriginalCenter.y)
                }, completion: { (finished) -> Void in
                    self.isMenuExpanded = false;
            })
        }
        
    }
}
