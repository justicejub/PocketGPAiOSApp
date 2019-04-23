//
//  SemesterDetailsTableViewCell.swift
//  Pocket GPA
//
//  Created by Justice Jubilee on 4/20/19.
//  Copyright © 2019 Justice Jubilee. All rights reserved.
//

import UIKit

class SemesterDetailsTableViewCell: UITableViewCell {

    
    @IBOutlet weak var letterGradeLabel: UILabel!
    @IBOutlet weak var subjectNameLabel: UILabel!
    @IBOutlet weak var subjectCreditsLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
