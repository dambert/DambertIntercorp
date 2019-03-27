//
//  HomeViewController.swift
//  DambertIntercorp
//
//  Created by Dambert.Munoz on 3/26/19.
//  Copyright © 2019 dambert.intercorp.retail. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    
    @IBOutlet var nameLabel: UILabel!
    
    // MARK: Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        
        UserService.sharedInstance.getUser { (userModel) in
            
            let user = userModel
            if user != nil {
                self.nameLabel.text = user?.name.uppercased()
                
            }
        }
    }
    
    func setupView(){
        
    }
    
    
    

}
