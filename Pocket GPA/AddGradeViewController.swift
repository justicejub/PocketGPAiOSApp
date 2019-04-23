//
//  AddGradeViewController.swift
//  Pocket GPA
//
//  Created by Justice Jubilee on 3/25/19.
//  Copyright © 2019 Justice Jubilee. All rights reserved.
//

import UIKit

class AddGradeViewController: UIViewController {

    @IBOutlet weak var gradeNameTextFieldInput: UITextField!
    @IBOutlet weak var gradeValueTextFieldInput: UITextField!
    
    var currentAssignmentIndex: Int!
    var currentSubjectIndex: Int!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func submitGradeTapped(_ sender: Any) {
        if (gradeNameTextFieldInput.hasText && gradeValueTextFieldInput.hasText) {
            
            //print(gradeValueTextFieldInput.text)
            
            //creating new grade for grades
            let grade1: Grade = Grade (gName: (gradeNameTextFieldInput.text)!, score: Double(gradeValueTextFieldInput.text!)!)
            
            //add to  grade to grades array
            classes[currentSubjectIndex!].assignments[currentAssignmentIndex!].grades.append(grade1)
       
            updateAssignmentGPA(subjectIndex: currentSubjectIndex, assignmentIndex: currentAssignmentIndex);
            updateSubjectGPA(subjectIndex: currentSubjectIndex);
            updateSubjectLetterGrade(subjectIndex: currentSubjectIndex);
            updateSemesterGPA()
            
            navigationController?.popViewController(animated: true) //goes back
            
            //print(classes[currentSubjectIndex!].assignments[currentAssignmentIndex!].grades.count)
        }
        
    }
    /*
    public func updateAssignmentGPA(subjectIndex: Int, assignmentIndex: Int){
        //accumulates sum of all gradescores in grades array
        var total: Double = 0;
        for grade in classes[subjectIndex].assignments[assignmentIndex].grades {
            let currentGradeValue: Double = grade.score / 100.0
            
            total = total + currentGradeValue
        }
        
        let updatedAssignGPA: Double = total / Double(classes[currentSubjectIndex!].assignments[currentAssignmentIndex!].grades.count)
        //updates accumulated assignment gpa
        classes[currentSubjectIndex!].assignments[currentAssignmentIndex!].totalScore = updatedAssignGPA
        
    }
    */
    
    /*
    func updateSubjectGPA() {
        var totalScore: Double = 0;
        var totalWeight: Double = 0; // should end up as 100
        
        for assignment in classes[currentSubjectIndex!].assignments {
            totalScore = totalScore + (assignment.aWeight * assignment.totalScore)
            totalWeight = totalWeight + assignment.aWeight
        }
        
        let updatedSubjectGPA: Double = totalScore / totalWeight
        
        classes[currentSubjectIndex!].gpa = updatedSubjectGPA;
    }
 
    */
    
//    func updateSubjectLetterGrade(){
//        let currentSubjectGrade = Int(classes[currentSubjectIndex!].gpa * 100);
//
//        if (currentSubjectGrade > 90 || currentSubjectGrade == 90){
//            classes[currentSubjectIndex!].letterGrade = "A";
//        }
//        else if (currentSubjectGrade > 85 && currentSubjectGrade < 89
//                || classes[currentSubjectIndex!].gpa == 89){
//            classes[currentSubjectIndex!].letterGrade = "B+";
//        }
//        else if (currentSubjectGrade > 80 && currentSubjectGrade < 85
//            || currentSubjectGrade == 85 || currentSubjectGrade == 80 ){
//            classes[currentSubjectIndex!].letterGrade = "B";
//        }
//        else if (currentSubjectGrade > 75 && currentSubjectGrade < 80){
//            classes[currentSubjectIndex!].letterGrade = "C+";
//        }
//        else if (currentSubjectGrade > 70 && currentSubjectGrade < 75
//            || currentSubjectGrade == 75 || currentSubjectGrade == 70){
//            classes[currentSubjectIndex!].letterGrade = "C";
//        }
//        else if (currentSubjectGrade > 60 && currentSubjectGrade < 70
//            || currentSubjectGrade == 60){
//            classes[currentSubjectIndex!].letterGrade = "D";
//        }
//        else {
//            classes[currentSubjectIndex!].letterGrade = "F";
//        }
//    }
//
//    func updateSemesterGPA(){
//        var totalCredits: Int = 0;
//        var currentScore: Double = 0.0;
//        var totalScore: Double = 0.0
//        
//        for subject in classes {
//            if (subject.letterGrade == "A"){
//                totalCredits += subject.credits;
//                currentScore = 4.0;
//                totalScore += (Double(subject.credits) * currentScore);
//            }
//            else if (subject.letterGrade == "B+"){
//                totalCredits += subject.credits;
//                currentScore = 3.5;
//                totalScore += (Double(subject.credits) * currentScore);
//            }
//            else if (subject.letterGrade == "B"){
//                totalCredits += subject.credits;
//                currentScore = 3.0;
//                totalScore += (Double(subject.credits) * currentScore);
//            }
//            else if (subject.letterGrade == "C+"){
//                totalCredits += subject.credits;
//                currentScore = 2.5;
//                totalScore += (Double(subject.credits) * currentScore);
//            }
//            else if (subject.letterGrade == "C"){
//                totalCredits += subject.credits;
//                currentScore = 2.0;
//                totalScore += (Double(subject.credits) * currentScore);
//            }
//            else if (subject.letterGrade == "D"){
//                totalCredits += subject.credits;
//                currentScore = 1;
//                totalScore += (Double(subject.credits) * currentScore);
//            }
//            else if (subject.letterGrade == "F"){
//                totalCredits += subject.credits;
//                currentScore = 0;
//                totalScore += (Double(subject.credits) * currentScore);
//            }
//        }
//        
//        semesterGPA = totalScore / (Double)(totalCredits);
//    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
