//
//  PriceTableViewCell.swift
//  FashionWardrobe
//
//  Created by Daria Smirnova on 09/05/17.
//  Copyright © 2017 Daria Smirnova. All rights reserved.
//

import UIKit

protocol PriceTableViewCellDelegate {
    func beginEditing()
    func endEditing()
}

class PriceTableViewCell: UITableViewCell {
    @IBOutlet weak var priceTextField : UITextField!
    var delegate : PriceTableViewCellDelegate?
    override func awakeFromNib() {
        super.awakeFromNib()
        self.priceTextField.delegate = self
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}

extension PriceTableViewCell : UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.contentView.endEditing(true)
        return true
    }
    func textFieldDidBeginEditing(_ textField: UITextField) {
        delegate?.beginEditing()
    }
    func textFieldDidEndEditing(_ textField: UITextField) {
        delegate?.endEditing()
    }
}
