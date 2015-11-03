//
//  VenueDetailViewController.swift
//  wonderlust
//
//  Created by Yang Tang on 10/29/15.
//  Copyright © 2015 Yang Tang. All rights reserved.
//

import UIKit

class VenueDetailViewController: UIViewController {

    @IBOutlet weak var scrollView: UIScrollView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        // hardcoded now
        scrollView.contentSize = CGSize(width: 375, height: 1100)
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

}
