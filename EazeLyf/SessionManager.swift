//
//  SessionManager.swift
//  EazeLyf
//
//  Created by Raunak Biswas on 25/08/2016.
//  Copyright © 2016 Raunak Biswas. All rights reserved.
//

import Foundation
import Alamofire

protocol SessionManagerProtocol : NSObjectProtocol {
    func didLogin(user : EUser)
    func didLogout()
}

let kLoggedInUserKey = "loggedInUserData"

class SessionManager: NSObject {
    static let sharedInstance = SessionManager()
    var baseURL = "http://appsquad.cloudapp.net:8080/RESTfulExample/rest/category" //manage this in info.plist
    weak var delegate: SessionManagerProtocol?
    var loggedInUser: EUser?
    
//    var token: dispatch_once_t = 0
//    override init() {
//        dispatch_once(&token) {
//            print("This is printed only on the first call to test()")
//        }
//    }
    
    func signInWithContactNumber(parameters: [String: AnyObject]? = nil) {
        Alamofire.request(.POST, String(format: "%@/userlogin", baseURL), parameters: parameters, encoding: .URL)
            .responseJSON { response in
                if let JSON = response.result.value {
                    print("Response json: \(JSON)")
                    let respData = JSON as! [String: AnyObject]
                    if (!respData["status"]!.isEqual("failed")){
                        let userData: [String:AnyObject] = [
                            "name" : respData["status"]!,
                            "contactnumber" : parameters!["mobileNumber"]!
                        ]
                        self.loggedInUser = EUser(data: userData)
                        self.delegate?.didLogin(self.loggedInUser!)
                    }
                    
                }
        }
    }
    
    func signUpWithContactNumber(parameters: [String: AnyObject]? = nil) {
        Alamofire.request(.POST, String(format: "%@/signup", baseURL), parameters: parameters, encoding: .URL)
            .responseJSON { response in
                if let JSON = response.result.value {
                    print("Response json: \(JSON)")
                    let respData = JSON as! [String: AnyObject]
                    if (!respData["status"]!.isEqual("failed")){
                        self.loggedInUser = EUser(data: respData)
                        self.delegate?.didLogin(self.loggedInUser!)
                    }
                    
                }
        }
    }
    
    func signInWithFacebook(){
        
    }
    
    func signInWithGoogle(){
        
    }
    
    func onLoginSuccess(didLogInUser user: EUser) {
        self.delegate?.didLogin(user)
    }
    
    func logout(){
        NSUserDefaults.standardUserDefaults().setObject(nil, forKey: kLoggedInUserKey)
        self.loggedInUser = nil
        self.delegate?.didLogout()
    }
}