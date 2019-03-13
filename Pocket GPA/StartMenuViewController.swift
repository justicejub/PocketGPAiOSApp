//
//  StartMenuViewController.swift
//  Pocket GPA
//
//  Created by Justice Jubilee on 3/7/19.
//  Copyright © 2019 Justice Jubilee. All rights reserved.
//

import UIKit

class StartMenuViewController: UIViewController {
    
    @IBOutlet weak var creditsInputTextField: UITextField!
    @IBOutlet weak var classInputTextField: UITextField!
    
    
    @IBAction func getStartedTapped(_ sender: Any) {
        if classInputTextField.hasText && creditsInputTextField.hasText{
            self.performSegue(withIdentifier: "getStartedSegue", sender: self)
        }else{
            print("Enter Course Name")
        }
    }
   
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "getStartedSegue" {
            guard let destinationViewController = segue.destination as? SemesterDetailsTableViewController
                else{
                    return
            }
            
            let class1: Subject = Subject(name: (classInputTextField.text)!, credits: Int(creditsInputTextField.text!)!, gpa: 0, assignments: [])
            totalCredits += Int(creditsInputTextField.text!)!
            classes.append(class1);
           // destinationViewController.class1 = classInputTextField.text
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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
