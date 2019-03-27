//
//  PhoneNumberVerifyViewController.swift
//  DambertIntercorp
//
//  Created by Dambert.Munoz on 3/26/19.
//  Copyright © 2019 dambert.intercorp.retail. All rights reserved.
//

import UIKit
import FirebaseAuth


class PhoneNumberVerifyViewController: UIViewController {
    
    @IBOutlet var verificationCodeTextField: UITextField!
    
    var verificationID:String?

    // MARK: Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    // MARK: Own Methods
    @IBAction func verifyCodeTap(_ sender: Any) {
        
        if(self.verificationCodeTextField.text?.isEmpty == true){
            
            Helper.showAlert(message: Constants.MessagesVC.PHONE_NUMBER_VERIFY_REQUIRED, viewController: self)
            return
        }
        
        // Mostrar loading
        Helper.showLoading(viewController: self)
        
        // Se crea unas credenciales .credential(verificationID, codigo de verificacion)
        let credential = PhoneAuthProvider.provider().credential(withVerificationID: self.verificationID!, verificationCode: self.verificationCodeTextField.text!)
        
        // Se realiza el login del usuario en firebase
        Auth.auth().signInAndRetrieveData(with: credential) { (authResult, error) in
            
            Helper.hideLoading(viewController: self)
            if  error  != nil {
                
                Helper.showAlert(message: Constants.MessagesVC.PHONE_NUMBER_VERIFY_ERROR_LOGIN, viewController: self)
                return
                
            }else{
            
                // Si el auth login fue correcto, entonces te redirigo al formulario de usuarios
                self.performSegue(withIdentifier: Constants.Segue.VERIFY_TO_REGISTER_DATA_USER , sender: nil)
            }
            
        }
        
        
        
    }
    
}
