//
//  FormUserViewController.swift
//  DambertIntercorp
//
//  Created by Dambert.Munoz on 3/26/19.
//  Copyright © 2019 dambert.intercorp.retail. All rights reserved.
//

import UIKit

class FormUserViewController: UIViewController {

    
    // MARK: Properties
    @IBOutlet var nameTextField: UITextField!
    @IBOutlet var lastNameTextField: UITextField!
    @IBOutlet var birthdayDatePicker: UIDatePicker!
    
    
    
    // MARK: Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    // MARK: Own Methods
    @IBAction func doneTap(_ sender: Any) {
        
        // Si el formulario es válido entonces procedemos a guardar la información adicional
        if self.isValidForm() {
            
            // Mostrar Loading
            Helper.showLoading(viewController: self)
            
            // Registrar la data adicional de usuario
            let formatter = DateFormatter()
            formatter.dateFormat = "dd-MM-yyyy"
            let user = UserModel(name: self.nameTextField.text! , lastname: self.lastNameTextField.text! , birthday: formatter.string(from: self.birthdayDatePicker.date))
            
            // Guardamos al usuario en el documento /users/ en FirebaseRealtimeDatabase
            UserService.sharedInstance.saveUser(userModel: user) { (success) in
                
                // Ocultar Loading
                Helper.hideLoading(viewController: self)
                
                // Se logró guardar la información adicional del usuario exitosamente
                if success == true {
                     //Redireccionamos al HomeViewController                    
                     self.performSegue(withIdentifier: Constants.Segue.REGISTER_DATA_USER_TO_HOME, sender: nil)
                }else{
                    // Ocurrió un error                    
                    Helper.showAlert(message:Constants.MessagesVC.FORM_USER_ERROR , viewController: self)
                }
            }
        }
    }
    
    /**
     Validación del formulario, se valida que todos los campos estén completos
     - Returns: Bool indica si es válido o no
     */
    func isValidForm()->Bool{
        
        var messageValidation = ""
        if(self.nameTextField.text?.isEmpty == true){
            messageValidation = Constants.MessagesVC.FORM_USER_VALIDATION_NAME
        }else if(self.lastNameTextField.text?.isEmpty == true){
            messageValidation = Constants.MessagesVC.FORM_USER_VALIDATION_LASTNAME
        }
        
        if messageValidation.isEmpty == false {
            
            Helper.showAlert(message: messageValidation, viewController: self)
            return false
        }
        
        return true
    }
    
    

}
