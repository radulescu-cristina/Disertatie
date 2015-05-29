//
//  LandingViewController.swift
//  PickUpMyCar2
//
//  Created by Cristina Radulescu on 5/29/15.
//  Copyright (c) 2015 Cristina Radulescu. All rights reserved.
//

import Foundation
import UIKit

class LandingViewController: UIViewController
{
    private var initialViewController: UIViewController?
    
    @IBOutlet weak var facebookLoginButton: UIButton!
    
    
    @IBAction func didTapLoginButton(sender: UIButton) {
        FBSDKLoginManager().logInWithReadPermissions(["public_profile", "email", "user_friends"], handler: handleFacebookLoginResponse)
        facebookLoginButton.hidden = true
    }
    func handleFacebookLoginResponse(result: FBSDKLoginManagerLoginResult!, error: NSError!)
    {
        if error != nil {
            self.handleFacebookLoginError(error)
        } else if (result.isCancelled) {
            self.handleFacebookLoginCancellation(result)
        } else {
            self.goToHomeScreen()        }
    }
    
    func handleFacebookLoginError(error: NSError!)
    {
        self.prepareForRetry()
    }
    
    func handleFacebookLoginCancellation(result: FBSDKLoginManagerLoginResult!)
    {
        self.prepareForRetry()
    }
    
    
    func goToHomeScreen()
    {
        let storyboard = UIStoryboard(name:"AbroadMain", bundle:nil)
        initialViewController = storyboard.instantiateInitialViewController() as? UIViewController
        self.presentViewController(initialViewController!, animated:true, completion:nil)
    }
    
    
    func prepareForRetry()
    {
        facebookLoginButton.hidden = false
    }
    
}