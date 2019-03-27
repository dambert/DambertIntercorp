//
//  Helper.swift
//  DambertIntercorp
//
//  Created by Dambert.Munoz on 3/26/19.
//  Copyright © 2019 dambert.intercorp.retail. All rights reserved.
//

import UIKit
import NVActivityIndicatorView

class Helper: NSObject {
    
    
    // MARK: Properties
    static var activityLoading: NVActivityIndicatorView?
    
    
    
    // MARK: Own Methods
    /**
     Obtiene un alerta
     - Parameter message: Mensaje de la alerta
     */
    static func getAlert(message:String)->UIAlertController{
        let alert = UIAlertController(title: nil, message: message, preferredStyle: .alert)
        let action1 = UIAlertAction(title: "OK", style: .default, handler: nil)
        alert.addAction(action1)
        
        return alert
    }
    
    /**
     Muestra la alerta
     - Parameter message: Mensaje de la alerta
     - Parameter viewController: ViewController donde se mostrará la alerta
     */
    static func showAlert(message:String, viewController:UIViewController){
        let alert = self.getAlert(message: message)
        viewController.present(alert, animated: true, completion: nil)
    }
    
    /**
     Muestra el custom Loading
     - Parameter viewController: ViewController donde se mostrará el loading
     */
    static func showLoading(viewController:UIViewController){
        if self.activityLoading == nil {
            let rect = viewController.view.frame
            self.activityLoading = NVActivityIndicatorView(frame: CGRect(x:  (rect.origin.x + rect.width/2) - 50 , y: (rect.origin.y +  rect.height/2), width: 100 , height: 30), type: NVActivityIndicatorType.ballGridPulse , color: UIColor.blue , padding: 0)
        }
        
        viewController.view.isUserInteractionEnabled = false
        viewController.view.addSubview(self.activityLoading!)
        self.activityLoading?.startAnimating()
    }
    
    /**
     Cierra el loading
     - Parameter viewController: ViewController donde se mostrará el loading
     */
    static func hideLoading(viewController:UIViewController){
        
        viewController.view.isUserInteractionEnabled = true
        self.activityLoading?.removeFromSuperview()
        self.activityLoading?.stopAnimating()
    }
    
    /**
     Método que calcula la edad
     - Parameter birthday: Fecha Nacimiento en formato dd-MM-yyyy
     */
    static func calcAge(birthday: String) -> Int? {
        
        let dateFormater = DateFormatter()
        dateFormater.dateFormat = "dd-MM-yyyy"
        let birthdayDate = dateFormater.date(from: birthday)
        let calendar: NSCalendar! = NSCalendar(calendarIdentifier: .gregorian)
        let now = Date()
        let calcAge = calendar.components(.year, from: birthdayDate!, to: now, options: [])
        let age = calcAge.year
        return age
    }
    
    
    
    
    
}
