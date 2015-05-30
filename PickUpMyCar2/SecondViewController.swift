//
//  SecondViewController.swift
//  PickUpMyCar2
//
//  Created by Cristina Radulescu on 5/29/15.
//  Copyright (c) 2015 Cristina Radulescu. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {
    
    @IBOutlet var imageView: UIWebView!
    override func viewDidLoad()
    {
        super.viewDidLoad()
        self.returnUserData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func returnUserData()
    {
        let graphRequest : FBSDKGraphRequest = FBSDKGraphRequest(graphPath: "me", parameters: nil)
        graphRequest.startWithCompletionHandler({ (connection, result, error) -> Void in
            
            if ((error) != nil)
            {
                // Process error
                println("Error: \(error)")
            }
            else
            {
                println("fetched user: \(result)")
                let userName : NSString = result.valueForKey("name") as! NSString
                println("User Name is: \(userName)")
                let userEmail : NSString = result.valueForKey("email") as! NSString
                println("User Email is: \(userEmail)")
                let id : NSString = result.valueForKey("id") as! NSString
                let avatarLocation: String = "https://graph.facebook.com/\(id)/picture"
                println("User Email is: \(avatarLocation)")
                self.getProfilePic(avatarLocation)

            }
        })
    }
    
    func getProfilePic(url: String)
    {
        imageView.loadRequest(NSURLRequest(URL: NSURL(string: url)!))
    }
}

