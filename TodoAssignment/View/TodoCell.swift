//
//  TodoCell.swift
//  TodoAssignment
//
//  Created by madhur on 28/08/20.
//  Copyright © 2020 Unilancer Corporation Ltd. All rights reserved.
//

import UIKit

class TodoCell: UITableViewCell {

    @IBOutlet weak var doneImg: UIImageView!
    @IBOutlet weak var tasklabel: UILabel!
    
    var isCheck = false
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
