//
//  UserService.swift
//  DambertIntercorp
//
//  Created by Dambert.Munoz on 3/26/19.
//  Copyright © 2019 dambert.intercorp.retail. All rights reserved.
//

import UIKit

import Firebase
import FirebaseAuth
import FirebaseDatabase

class UserService: NSObject {
    
    // MARK: Properties
    
    // Shared Instance
    static let sharedInstance = UserService()
    //Referencia al documento users
    let ref: DatabaseReference = Database.database().reference(withPath: "users")
    
    // Mark: Own Methods
    
    /**
     Método que permite guardar los datos adicionales del usuario en el documento user
     - Parameter userModel: Usuario
     - Parameter success: Callback que indica si se logró guardar la información del usuario en Realtimedatabase
     */
    func saveUser(userModel:UserModel, success:@escaping (Bool)->Void){
        
        let uid = Auth.auth().currentUser?.uid
               
        
        self.ref.child(uid!).setValue(userModel.toAnyObject()) { (error, databaseref) in

            if (error != nil){
                success(false)
            }else{
                success(true)
            }
        }
        
    }
    
    
    /**
     Método que obtiene la información adicional del documento usuario por su UID
     - Parameter userModel: Usuario
     - Parameter success: Callback
     */
    func getUser(success:@escaping (UserModel?)->Void){
        
        let uid = Auth.auth().currentUser?.uid
        
        self.ref.child(uid!).observe(.value) { (snapshot) in
            if snapshot.exists() {
                
                let data = snapshot.value as? [String:String]
                let user = UserModel(name: data?["name"] ?? "", lastname: data?["lastname"] ?? "", birthday: data?["birthday"] ?? "")
                
                success(user)
            } else{
                success(nil)
            }
        }
    }
    
    
}
