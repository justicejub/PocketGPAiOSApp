//
//  AddAssignmentViewController.swift
//  Pocket GPA
//
//  Created by Justice Jubilee on 3/23/19.
//  Copyright © 2019 Justice Jubilee. All rights reserved.
//

import UIKit

class AddAssignmentViewController: UIViewController {

    @IBOutlet weak var addAssignmentTextField: UITextField!
    @IBOutlet weak var assignmentWeightTextField: UITextField!
    
    var currentSubjectIndex: Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func submitAssignmentTapped(_ sender: Any) {
        
        if (addAssignmentTextField.hasText && assignmentWeightTextField.hasText){
            
            let assign1: Assignment = Assignment(aName: (addAssignmentTextField.text)!, aWeight: Double(assignmentWeightTextField.text!)!, grades: [], totalScore: 0)
            
            classes[currentSubjectIndex!].assignments.append(assign1)
            //print(assign1.totalScore)
        }
        
        navigationController?.popViewController(animated: true) //goes back
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
