//
//  EUser.swift
//  EazeLyf
//
//  Created by Raunak Biswas on 25/08/2016.
//  Copyright © 2016 Raunak Biswas. All rights reserved.
//

import Foundation

class EUser: NSObject {
    
    var name: String?
    var email: String?
    var contactnumber: String?
    var refcode: String?
    var location: String?
    
    init(data: [String: AnyObject])
    {
        super.init()
        
        name = data["name"] as? String
        email = data["email"] as? String
        contactnumber = data["contactnumber"] as? String
        refcode = data["refcode"] as? String        
        location = data["location"] as? String
    }
    
}