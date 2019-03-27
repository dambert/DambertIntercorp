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
            Helper.showAlert(message: "Es necesario ingresar tu número para poder verificarlo" , viewController: self)
        }
        
        
        Helper.showLoading(viewController: self)
        
        // Defino Lenguaje Code spanish.
        Auth.auth().languageCode = "es";
        
        // Número concatenado
        let number = "+51"+self.phoneTextField.text!
        PhoneAuthProvider.provider().verifyPhoneNumber(number, uiDelegate: nil) { (verificationID, error) in
            
            
            Helper.hideLoading(viewController: self)
            if error != nil{
                Helper.showAlert(message: "Error al intentar verificar tu numero, vuelva a intentarlo" , viewController: self)
                return
            }else{
                self.performSegue(withIdentifier: Constants.Segue.PHONE_TO_VERIFY, sender: verificationID)
            }
            
            
            
        }
        
    }
    
    
    
    




}
