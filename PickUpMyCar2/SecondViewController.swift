//
//  SecondViewController.swift
//  PickUpMyCar2
//
//  Created by Cristina Radulescu on 5/29/15.
//  Copyright (c) 2015 Cristina Radulescu. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {
    
    @IBOutlet var userName: UILabel!
    @IBOutlet var userMail: UILabel!
    @IBOutlet var profilePicture: UIWebView!
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
                let userFbName : NSString = result.valueForKey("name") as! NSString
                self.userName.text = userFbName.description
                
                let userEmail : NSString = result.valueForKey("email") as! NSString
                self.userMail.text = userEmail.description
                
                let id : NSString = result.valueForKey("id") as! NSString
                let avatarLocation: String = "https://graph.facebook.com/\(id)/picture"
                self.getProfilePic(avatarLocation)
            }
        })
    }
    
    func getProfilePic(url: String)
    {
        profilePicture.loadRequest(NSURLRequest(URL: NSURL(string: url)!))
    }
}

