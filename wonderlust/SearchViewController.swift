//
//  SearchViewController.swift
//  wonderlust
//
//  Created by Carolyn Yang on 11/7/15.
//  Copyright © 2015 Yang Tang. All rights reserved.
//

import UIKit

class SearchViewController: UIViewController {
    
    @IBOutlet weak var searchImage: UIImageView!
    @IBOutlet weak var searchTextField: UITextField!
    
    var searchState:Int!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        searchState = 0
        searchTextField.text = ""
    }
    
    @IBAction func searchButtonTap(sender: AnyObject) {
        updateSearch()
    }
    
    @IBAction func searchInputChanged(sender: UITextField) {
        updateSearch()
    }
    
    func updateSearch() {
        switch(searchState){
        case 0:
            searchState = 1
            searchImage.image = UIImage(named: "Search2")
        case 1:
            searchState = 2
            searchImage.image = UIImage(named: "Search3")
        case 2:
            searchState = 0
            performSegueWithIdentifier("citySummary", sender: self)
        default:
            searchState = 0
        }
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
