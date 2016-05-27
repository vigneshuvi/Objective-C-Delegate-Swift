# Objective-C Delegate in Swift 

Register Objective-C notification protocal in Swift Project.


If you want achieve objective-c delegate in to swift. You need to do following steps.

1. Need to create bridge file to import your objective-c classes

        //
        //  Use this file to import your target's public headers that you would like to expose to Swift.
        //

        #import "UVIViewController.h"


2. You need to extend the protocol name in your swift viewcontroller 

        import UIKit

        class ViewController: UVIViewController, UVIDataRefreshProtocol {   // 2. Extend Protocal
            
            var secondController: DelegateViewController?

            @IBOutlet var delegateRefresh: UILabel!
            
            override func viewDidLoad() {
                super.viewDidLoad()
                // Do any additional setup after loading the view, typically from a nib.

                self.registerForBasicDataRefreshNotification();             //  3. Register the protocol notification
            }

            override func didReceiveMemoryWarning() {
                super.didReceiveMemoryWarning()
                // Dispose of any resources that can be recreated.
            }
            
            // Register the protocol notification with same name. Example : DataRefreshNotification
            override func registerForBasicDataRefreshNotification() {
            
                self.validateBasicDataRefreshNotification();
                NSNotificationCenter.defaultCenter().addObserver(        // 4. Register the protocol notification with same name.
                    self,
                    selector: "basicDataDidRefresh",
                    name: DataRefreshNotification,
                    object: nil)
            
            }
            
            override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
                delegateRefresh.text = "";
                if segue.identifier == "view_to_delegate" {
                    secondController = segue.destinationViewController as? DelegateViewController
                }
            }
            
            // Basic Data Did Refresh Notification
            func basicDataDidRefresh() {                            //  4. Event will be triggered while calling the protocol post notification. called with same name
                    NSLog("\n Basic data is refreshed")
                    delegateRefresh.text = "Basic data is refreshed";
            }

        }


--------

        5. NSNotificationCenter.defaultCenter().postNotificationName(DataRefreshNotification, object: nil)  // Call the notification.
        


#### Do you like it?

Do you like this repo? Share it on Twitter, Facebook, Google+ or anywhere you like so that more of us can use it and help. Thanks!

Created by [Vignesh](http://vigneshuvi.github.io/) 

![alt text][logo]

[logo]: https://github.com/vigneshuvi/vigneshuvi.github.io/blob/master/favicon.ico/android-icon-48x48.png
