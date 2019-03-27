//
//  UserModel.swift
//  DambertIntercorp
//
//  Created by Dambert.Munoz on 3/26/19.
//  Copyright © 2019 dambert.intercorp.retail. All rights reserved.
//

import UIKit

/**
 Estructura que representa al documento User en RealTimeDatabase
 */
struct UserModel {
    
    // MARK: Properties
    var name:String
    var lastname:String
    var birthday:String
    
    
    init(name:String, lastname:String, birthday:String){
        
        self.name = name
        self.lastname = lastname
        self.birthday = birthday
    }
    
    func toAnyObject() -> Any {
        return [
            "name": self.name,
            "lastname": self.lastname,
            "birthday": self.birthday
        ]
    }
    

}
