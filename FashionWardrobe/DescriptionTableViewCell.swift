//
//  DescriptionTableViewCell.swift
//  FashionWardrobe
//
//  Created by Daria Smirnova on 08/05/17.
//  Copyright © 2017 Daria Smirnova. All rights reserved.
//

import UIKit

class DescriptionTableViewCell: UITableViewCell {

    @IBOutlet weak var textField : UITextField!
    override func awakeFromNib() {
        super.awakeFromNib()
        self.textField.delegate = self
        // Initialization code
    }
}

extension DescriptionTableViewCell : UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.contentView.endEditing(true)
        return true
    }
}
