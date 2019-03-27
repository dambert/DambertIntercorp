//
//  PhoneNumberViewController.swift
//  DambertIntercorp
//
//  Created by Dambert.Munoz on 3/26/19.
//  Copyright © 2019 dambert.intercorp.retail. All rights reserved.
//

import UIKit
import FirebaseAuth

class PhoneNumberViewController: UIViewController {

    // MARK: Properties
    @IBOutlet var phoneTextField: UITextField!
    
    
    
    // MARK: Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == Constants.Segue.PHONE_TO_VERIFY {
            
            let destinationVC = segue.destination as! PhoneNumberVerifyViewController
            destinationVC.verificationID = (sender as? String)
            
        }
        
        
    }
    
    // MARK: Login Phone Number
    @IBAction func tapVerifyPhoneNumber(_ sender: Any) {
        
        
        if(self.phoneTextField.text?.isEmpty == true){
            Helper.showAlert(message: Constants.MessagesVC.PHONE_NUMBER_REQUIRED , viewController: self)
            return
        }else if( (self.phoneTextField.text?.count ?? 0) < 9){
            Helper.showAlert(message: Constants.MessagesVC.PHONE_NUMBER_VALIDATION_LONGITUD , viewController: self)
            return
        }
        
        
        Helper.showLoading(viewController: self)
        
        // Defino Language Code spanish.
        Auth.auth().languageCode = "es";
        
        // Número concatenado
        let number = "+51"+self.phoneTextField.text!
        PhoneAuthProvider.provider().verifyPhoneNumber(number, uiDelegate: nil) { (verificationID, error) in
            
            
            Helper.hideLoading(viewController: self)
            if error != nil{
                Helper.showAlert(message:  Constants.MessagesVC.PHONE_NUMBER_VALIDATION_ERROR , viewController: self)
                return
            }else{
                self.performSegue(withIdentifier: Constants.Segue.PHONE_TO_VERIFY, sender: verificationID)
            }
            
            
            
        }
        
    }
    

}


extension PhoneNumberViewController: UITextFieldDelegate{
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        guard let textFieldText = textField.text,
            let rangeOfTextToReplace = Range(range, in: textFieldText) else {
                return false
        }
        let substringToReplace = textFieldText[rangeOfTextToReplace]
        let count = textFieldText.count - substringToReplace.count + string.count
        return count < 10
    }
}

