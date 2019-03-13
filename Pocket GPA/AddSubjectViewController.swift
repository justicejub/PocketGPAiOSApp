//
//  AddSubjectViewController.swift
//  Pocket GPA
//
//  Created by Justice Jubilee on 3/13/19.
//  Copyright © 2019 Justice Jubilee. All rights reserved.
//

import UIKit

class AddSubjectViewController: UIViewController {

    
    @IBOutlet weak var addSubjectTextField: UITextField!
    @IBOutlet weak var addCreditsTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func submitTapped(_ sender: Any) {
        let class1: Subject = Subject(name: (addSubjectTextField.text)!, credits: Int(addCreditsTextField.text!)!, gpa: 0, assignments: [])
        totalCredits += Int(addCreditsTextField.text!)!
        
        classes.append(class1);
        
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
