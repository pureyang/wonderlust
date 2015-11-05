//
//  VenueDetailViewController.swift
//  wonderlust
//
//  Created by Yang Tang on 10/29/15.
//  Copyright © 2015 Yang Tang. All rights reserved.
//

import UIKit

class VenueDetailViewController: UIViewController,UIScrollViewDelegate {

    
    @IBOutlet weak var textScrollView: UIScrollView!
    @IBOutlet weak var pictureScroll: UIScrollView!
    @IBOutlet weak var pictureContainer: UIView!
    
    @IBOutlet weak var imagePage: UIPageControl!
    @IBOutlet weak var detailText: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        textScrollView.contentSize = detailText.frame.size
        textScrollView.contentSize.height+=375
        // Adding images
        var image:UIImage
        var imageView:UIImageView
        var location:CGFloat = 0

        for i in 1...5 {
            image = UIImage(named: "L\(i)")!
            imageView = UIImageView(image:image)
            imageView.frame = CGRect(x: location, y: 0, width: image.size.width, height: image.size.height)
            location += image.size.width
            pictureContainer.addSubview(imageView)
        }
        pictureScroll.contentSize = CGSize(width: location, height: 375)
        imagePage.numberOfPages = 5
        imagePage.currentPage = 0
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.

    }
    
    func scrollViewDidScroll(scrollView: UIScrollView) {
        let page = scrollView.contentOffset.x / scrollView.frame.size.width
        self.imagePage.currentPage  = Int(round(page))

    }
    @IBAction func backClick(sender: UIButton) {
        performSegueWithIdentifier("toPickerView", sender: self)
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
