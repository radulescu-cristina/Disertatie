//
//  ThirdViewController.swift
//  PickUpMyCar2
//
//  Created by Cristina Radulescu on 5/30/15.
//  Copyright (c) 2015 Cristina Radulescu. All rights reserved.
//

import Foundation
import UIKit

class ThirdViewController : UIViewController
{
    @IBOutlet var facebookLogOutButton: UITabBarItem!
    private var initialViewController: UIViewController?
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
       // self.tabBar(<#tabBar: UITabBar#>, facebookLogOutButton)
        
        let loginManager = FBSDKLoginManager()
        loginManager.logOut() // this is an instance function
        
        let storyboard = UIStoryboard(name:"LandingStoryBoard", bundle:nil)
        initialViewController = storyboard.instantiateInitialViewController() as? UIViewController
        self.presentViewController(initialViewController!, animated:true, completion:nil)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}