//
//  ViewController.swift
//  SwiftObjective
//
//  Created by Vignesh on 5/27/16.
//  Copyright © 2016 vigneshuvi. All rights reserved.
//

import UIKit

class ViewController: UVIViewController, UVIDataRefreshProtocol {
    
    var secondController: DelegateViewController?

    @IBOutlet var delegateRefresh: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.registerForBasicDataRefreshNotification();
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func registerForBasicDataRefreshNotification() {
    
        self.validateBasicDataRefreshNotification();
        NSNotificationCenter.defaultCenter().addObserver(
            self,
            selector: "basicDataDidRefresh",
            name: DataRefreshNotification,
            object: nil)

    
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        delegateRefresh.text = "";
        NSLog("\n  1st View controller button clicked");
        if segue.identifier == "view_to_delegate" {
            secondController = segue.destinationViewController as? DelegateViewController
        }
    }
    
    // Basic Data Did Refresh Notification
    
    func basicDataDidRefresh() {
            NSLog("\n  1st Viewcontroller - Basic data is refreshed")
            delegateRefresh.text = "Basic data is refreshed";
    }

}

