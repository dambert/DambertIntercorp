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
        }else if( (self.verificationCodeTextField.text?.count ?? 0) < 6){
            Helper.showAlert(message: "Su código de verificación debe tener 6 dígitos" , viewController: self)
            return
        }
        
        // Mostrar loading
        Helper.showLoading(viewController: self)
        
        // Se crea unas credenciales .credential(verificationID, codigo de verificacion)
        let credential = PhoneAuthProvider.provider().credential(withVerificationID: self.verificationID!, verificationCode: self.verificationCodeTextField.text!)
        
        // Se realiza el login del usuario en firebase
        Auth.auth().signInAndRetrieveData(with: credential) { (authResult, error) in
            
           
            if  error  != nil {
                Helper.hideLoading(viewController: self)
                Helper.showAlert(message: Constants.MessagesVC.PHONE_NUMBER_VERIFY_ERROR_LOGIN, viewController: self)
                return
                
            }else{
            
                // Verificamos si el usuario ya tiene información guardada en firebase realtimedatabase
                UserService.sharedInstance.getUser(success: { (user) in
                    
                    Helper.hideLoading(viewController: self)
                    if user != nil{                        
                        self.navigationController?.popToRootViewController(animated: false)
                        // Si el auth login fue correcto, entonces te redirigo al formulario de usuarios
                        self.performSegue(withIdentifier: Constants.Segue.VERIFY_TO_HOME , sender: nil)
                    }else{
                        // Si el auth login fue correcto, entonces te redirigo al formulario de usuarios
                        self.performSegue(withIdentifier: Constants.Segue.VERIFY_TO_REGISTER_DATA_USER , sender: nil)
                    }
                })
                
            }
            
        }
        
        
        
    }
    
}

extension PhoneNumberVerifyViewController: UITextFieldDelegate{
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        guard let textFieldText = textField.text,
            let rangeOfTextToReplace = Range(range, in: textFieldText) else {
                return false
        }
        let substringToReplace = textFieldText[rangeOfTextToReplace]
        let count = textFieldText.count - substringToReplace.count + string.count
        return count <= 7
    }
}
