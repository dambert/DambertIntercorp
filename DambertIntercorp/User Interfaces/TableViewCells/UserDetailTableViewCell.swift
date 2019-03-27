//
//  UserDetailTableViewCell.swift
//  DambertIntercorp
//
//  Created by Dambert.Munoz on 3/26/19.
//  Copyright © 2019 dambert.intercorp.retail. All rights reserved.
//

import UIKit

// Enum para definir el tipo de celda
enum UserDetailTableViewCellType{
    case Name
    case LastName
    case Birthday
    case Age
    
}

class UserDetailTableViewCell: UITableViewCell {

    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var descriptionLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func setupView(user:UserModel, typeCell: UserDetailTableViewCellType ){
        
        switch typeCell {
            case UserDetailTableViewCellType.Name:
                self.nameLabel.text = "Nombre"
                self.descriptionLabel.text = user.name
            break
            case UserDetailTableViewCellType.LastName:
                self.nameLabel.text = "Apellido"
                self.descriptionLabel.text = user.lastname
            break
            case UserDetailTableViewCellType.Birthday:
                self.nameLabel.text = "F.Nacimiento"
                self.descriptionLabel.text = user.birthday
            break
            case UserDetailTableViewCellType.Age:
                self.nameLabel.text = "Edad"
                let age = Helper.calcAge(birthday: user.birthday)
                if age != nil {
                    self.descriptionLabel.text = String(age!)
                }else{
                    self.descriptionLabel.text = ""
                }
                
            break
        }

    }

}
