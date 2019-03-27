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
        
        self.setupView()
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.navigationBar.isHidden = true
    }
    
    // MARK: Own methods
    func setupView(){
        
        UserService.sharedInstance.getUser { (userModel) in
            
            let user = userModel
            if user != nil {
                self.nameLabel.text = user?.name.uppercased()
                
            }
        }
    }
    
    
    

}
