//
//  SubjectDataSource.swift
//  Pocket GPA
//
//  Created by Justice Jubilee on 3/12/19.
//  Copyright © 2019 Justice Jubilee. All rights reserved.
//

import Foundation


//totalCredits Count
var totalCredits: Int = 0;
//overall gpa(semester gpa)
var semesterGPA: Double = 0;

//array of each class
var classes : [Subject] = [];



//subject structure with class details
struct Subject {
    let name: String
    let credits: Int
    var gpa: Double //percentage grade .. not converted to 4.0 scale yet
    var letterGrade: String
   var assignments: [Assignment]
}

struct Assignment {
    let aName: String
    let aWeight: Double
    var grades: [Grade]
    var totalScore: Double // percentage grade
}

struct Grade {
    let gName: String
    let score: Double
    
}


//** UPDATING grades/gpa functions **\\

func updateAssignmentGPA(subjectIndex: Int, assignmentIndex: Int){
    //accumulates sum of all gradescores in grades array
    var total: Double = 0;
    for grade in classes[subjectIndex].assignments[assignmentIndex].grades {
        let currentGradeValue: Double = grade.score / 100.0
        
        total = total + currentGradeValue
    }
    
    let updatedAssignGPA: Double = total / Double(classes[subjectIndex].assignments[assignmentIndex].grades.count)
    //updates accumulated assignment gpa
    classes[subjectIndex].assignments[assignmentIndex].totalScore = updatedAssignGPA
    
}

func updateSubjectGPA(subjectIndex: Int) {
    var totalScore: Double = 0;
    var totalWeight: Double = 0; // should end up as 100
    
    for assignment in classes[subjectIndex].assignments {
        totalScore = totalScore + (assignment.aWeight * assignment.totalScore)
        totalWeight = totalWeight + assignment.aWeight
    }
    
    let updatedSubjectGPA: Double = totalScore / totalWeight
    
    classes[subjectIndex].gpa = updatedSubjectGPA;
}

//
func updateSubjectLetterGrade(subjectIndex: Int){
    
    if (classes[subjectIndex].gpa > -1) {
        let currentSubjectGrade = Int(classes[subjectIndex].gpa * 100)
    
    
    if (currentSubjectGrade > 90 || currentSubjectGrade == 90){
        classes[subjectIndex].letterGrade = "A";
    }
    else if (currentSubjectGrade > 85 && currentSubjectGrade < 89
        || classes[subjectIndex].gpa == 89){
        classes[subjectIndex].letterGrade = "B+";
    }
    else if (currentSubjectGrade > 80 && currentSubjectGrade < 85
        || currentSubjectGrade == 85 || currentSubjectGrade == 80 ){
        classes[subjectIndex].letterGrade = "B";
    }
    else if (currentSubjectGrade > 75 && currentSubjectGrade < 80){
        classes[subjectIndex].letterGrade = "C+";
    }
    else if (currentSubjectGrade > 70 && currentSubjectGrade < 75
        || currentSubjectGrade == 75 || currentSubjectGrade == 70){
        classes[subjectIndex].letterGrade = "C";
    }
    else if (currentSubjectGrade > 60 && currentSubjectGrade < 70
        || currentSubjectGrade == 60){
        classes[subjectIndex].letterGrade = "D";
    }
    else {
        classes[subjectIndex].letterGrade = "F";
    }
    }
}

///
func updateSemesterGPA(){
    var totalCredits: Int = 0;
    var currentScore: Double = 0.0;
    var totalScore: Double = 0.0
    
    for subject in classes {
        if (subject.letterGrade == "A"){
            totalCredits += subject.credits;
            currentScore = 4.0;
            totalScore += (Double(subject.credits) * currentScore);
        }
        else if (subject.letterGrade == "B+"){
            totalCredits += subject.credits;
            currentScore = 3.5;
            totalScore += (Double(subject.credits) * currentScore);
        }
        else if (subject.letterGrade == "B"){
            totalCredits += subject.credits;
            currentScore = 3.0;
            totalScore += (Double(subject.credits) * currentScore);
        }
        else if (subject.letterGrade == "C+"){
            totalCredits += subject.credits;
            currentScore = 2.5;
            totalScore += (Double(subject.credits) * currentScore);
        }
        else if (subject.letterGrade == "C"){
            totalCredits += subject.credits;
            currentScore = 2.0;
            totalScore += (Double(subject.credits) * currentScore);
        }
        else if (subject.letterGrade == "D"){
            totalCredits += subject.credits;
            currentScore = 1;
            totalScore += (Double(subject.credits) * currentScore);
        }
        else if (subject.letterGrade == "F"){
            totalCredits += subject.credits;
            currentScore = 0;
            totalScore += (Double(subject.credits) * currentScore);
        }
    }
    
    semesterGPA = totalScore / (Double)(totalCredits);
}


