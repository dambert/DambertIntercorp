//
//  Constants.swift
//  DambertIntercorp
//
//  Created by Dambert.Munoz on 3/26/19.
//  Copyright © 2019 dambert.intercorp.retail. All rights reserved.
//

import Foundation

struct Constants{
    
    struct Segue{
        static let LOGIN_TO_HOME = "LOGIN_TO_HOME"
        static let PHONE_TO_VERIFY = "PHONE_TO_VERIFY"
        static let VERIFY_TO_HOME = "VERIFY_TO_HOME"
        static let VERIFY_TO_REGISTER_DATA_USER = "VERIFY_TO_REGISTER_DATA_USER"
        static let REGISTER_DATA_USER_TO_HOME = "REGISTER_DATA_USER_TO_HOME"
    }
    
    struct UserDefaults {
        static let USER = "USER"
    }
    
    struct MessagesVC{
        static let PHONE_NUMBER_VERIFY_REQUIRED = "Es necesario que ingreses el código de verificación del número"
        static let PHONE_NUMBER_VERIFY_ERROR_LOGIN = "Hubo un error al intentar loguearte , lo sentimos. Por favor , intente registrarse por otro método de autenticación"
    }
    
}
