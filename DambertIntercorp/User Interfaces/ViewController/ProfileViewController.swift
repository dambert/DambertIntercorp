//
//  ProfileViewController.swift
//  DambertIntercorp
//
//  Created by Dambert.Munoz on 3/26/19.
//  Copyright © 2019 dambert.intercorp.retail. All rights reserved.
//

import UIKit
import FirebaseAuth

let identifierCell = "userDetailTableViewCell"

class ProfileViewController: UIViewController {

    // MARK: Properties
    @IBOutlet var userInformationTableView: UITableView!
    
    
    var userDataArray:[UserDetailTableViewCellType] = []
    var user : UserModel?
    
    // MARK: Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Register dequeueReusableCell
        
        self.userInformationTableView.register(UINib(nibName: "UserDetailTableViewCell", bundle: nil), forCellReuseIdentifier: "userDetailTableViewCell")
        
        
        // Cargamos la información del usuario en viewController
        self.setupView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.navigationBar.isHidden = true
    }
    
    // MARK: Own Methods
    func setupView(){
        
        UserService.sharedInstance.getUser { (userModel) in
            
            if(userModel != nil){
                
                self.user = userModel
                
                //Agregamos la estructura de información a mostrar en el tableView
                self.userDataArray.append(UserDetailTableViewCellType.Name)
                self.userDataArray.append(UserDetailTableViewCellType.LastName)
                self.userDataArray.append(UserDetailTableViewCellType.Birthday)
                self.userDataArray.append(UserDetailTableViewCellType.Age)
                
                self.userInformationTableView.reloadData()
                
            }else{
                Helper.showAlert(message: "Ocurrió un error al recuperar la información del usuario", viewController: self)
            }
        }
        
    }
    
    
    // MARK: IBActions
    @IBAction func closeSessionTap(_ sender: Any) {
        
        try! Auth.auth().signOut()
        self.navigationController?.popToRootViewController(animated: true)
    }

}
extension ProfileViewController:UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.userDataArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: identifierCell , for: indexPath) as? UserDetailTableViewCell
        
        let typeCell = self.userDataArray[indexPath.row]
        cell?.setupView(user: self.user!, typeCell: typeCell)
        
        
        return cell!
        
    }
}
