//
//  DelegateViewController.swift
//  SwiftObjective
//
//  Created by Vignesh on 5/27/16.
//  Copyright © 2016 vigneshuvi. All rights reserved.
//

import UIKit

class DelegateViewController: UVIViewController {

    @IBOutlet var delegateButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()


        // Do any additional setup after loading the view.
    }
    
    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated)
        NSLog("\n 4 - 2nd view controller will disapper called");
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func delegationAction(sender: AnyObject) {
         NSLog("\n 2nd View controller button clicked");
        NSNotificationCenter.defaultCenter().postNotificationName(DataRefreshNotification, object: nil)
        self.navigationController?.popToRootViewControllerAnimated(true)
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
