//
//  SubjectDetailsTableViewCell.swift
//  Pocket GPA
//
//  Created by Justice Jubilee on 4/20/19.
//  Copyright © 2019 Justice Jubilee. All rights reserved.
//

import UIKit

class SubjectDetailsTableViewCell: UITableViewCell {

    @IBOutlet weak var assignmentName: UILabel!
    @IBOutlet weak var aWeightLabel: UILabel!
    @IBOutlet weak var aGrade: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
