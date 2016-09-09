//
//  AppDelegate.swift
//  EazeLyf
//
//  Created by Raunak Biswas on 23/08/2016.
//  Copyright © 2016 Raunak Biswas. All rights reserved.
//

import UIKit
import SlideMenuControllerSwift

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate, SessionManagerProtocol {

    var window: UIWindow?
    var controller: LogInViewController!

    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        UIApplication.sharedApplication().statusBarStyle = .LightContent
        SessionManager.sharedInstance.delegate = self
        if (SessionManager.sharedInstance.loggedInUser == nil) {
            self.loadLoginUI()
        } else {
            self.loadLoggedInUI()
        }
                
        return true
    }

    func applicationWillResignActive(application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(application: UIApplication) {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }
    
    private func setRootVC(rootVC: UIViewController) {
        if self.window == nil {
            self.window = UIWindow(frame: UIScreen.mainScreen().bounds)
        }
        
        if self.window?.rootViewController == nil {
            self.window?.rootViewController = rootVC
            self.window?.makeKeyAndVisible()
        } else {
            if self.window?.rootViewController?.presentedViewController != nil {
                self.window?.rootViewController?.dismissViewControllerAnimated(false, completion: nil)
            }
            
//            UIView.transitionWithView(self.window!, duration: 0.5, options: UIViewAnimationOptions.TransitionFlipFromLeft,
//                                      animations: {self.window!.rootViewController = rootVC}, completion: nil)
            
            self.window?.rootViewController = rootVC
        }
    }    
    
    func loadLoginUI() {
        let controller : LogInViewController = LogInViewController()
        let navigationController = UINavigationController()
        navigationController.navigationBar.barTintColor = UIColor(red: 225/255, green: 110/255, blue: 36/255, alpha: 1)
        navigationController.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.whiteColor()]
        navigationController.viewControllers = [controller]
        self.setRootVC(navigationController)
    }
    
    func loadLoggedInUI() {
        let leftViewController : LeftMenuViewController = LeftMenuViewController()
        let mainViewController : MainViewController = MainViewController()
        
        let navigationController: UINavigationController = UINavigationController(rootViewController: mainViewController)
        navigationController.navigationBar.barTintColor = UIColor(red: 225/255, green: 110/255, blue: 36/255, alpha: 1)
        leftViewController.mainViewController = navigationController
        
        let slideMenuController = SlideMenuController(mainViewController:navigationController, leftMenuViewController: leftViewController, rightMenuViewController: UIViewController())
        slideMenuController.automaticallyAdjustsScrollViewInsets = true
        
        self.setRootVC(slideMenuController)
    }
    
    func didLogin(user: EUser) {
        self.loadLoggedInUI()
    }
    
    func didLogout() {
        self.loadLoginUI()
    }

}

