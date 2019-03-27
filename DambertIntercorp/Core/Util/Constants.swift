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
        
        static let PHONE_NUMBER_REQUIRED = "Es necesario ingresar tu número para poder verificarlo."
        static let PHONE_NUMBER_VALIDATION_LONGITUD = "Su teléfono debe tener 9 digitos"
        static let PHONE_NUMBER_VALIDATION_ERROR = "Error al intentar verificar tu numero, vuelva a intentarlo"
        
        static let PHONE_NUMBER_VERIFY_REQUIRED = "Es necesario que ingreses el código de verificación del número"
        static let PHONE_NUMBER_VERIFY_ERROR_LOGIN = "Hubo un error al intentar ingresar , lo sentimos. Por favor , verifique si su código es correcto."
        
        
        static let FORM_USER_ERROR = "Ocurrió un error al guardar la información adicional del usuario, por favor vuelva a intentarlo."
        static let FORM_USER_VALIDATION_NAME = "Es necesario que ingreses tu nombre."
        static let FORM_USER_VALIDATION_LASTNAME = "Es necesario que ingreses tu apellido."
    }
    
}
