//
//  UserCell.swift
//  VRDevChat
//
//  Created by Volodymyr Romanov on 8/24/16.
//  Copyright © 2016 Volodymyr Romanov. All rights reserved.
//

import UIKit

class UserCell: UITableViewCell {
    @IBOutlet weak var firstName: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func updateUI(user: User) {
        firstName.text = user.firstName
    }
    
    func setCheckmark(selected: Bool) {
        let imageStr = selected ? "messageindicatorcehcked1" : "messageindicator1"
        self.accessoryView = UIImageView(image: UIImage(named: imageStr))
    }
}
