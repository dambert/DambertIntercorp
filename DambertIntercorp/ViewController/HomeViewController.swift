//
//  HomeViewController.swift
//  DambertIntercorp
//
//  Created by Dambert.Munoz on 3/26/19.
//  Copyright © 2019 dambert.intercorp.retail. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    
    // MARK: Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        UserService.sharedInstance.getUser { (userModel) in
            
            let user = userModel
            if user != nil {
                
                let age = Helper.calcAge(birthday: user!.birthday)
                
                print(age)
                
            }
        }
    }
    
    
    

}
