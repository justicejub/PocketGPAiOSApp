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

//array of each class
var classes : [Subject] = [];

//subject structure with class details
struct Subject {
    let name: String
    let credits: Int
    let gpa: Double
   let assignments: [Assignment]
}

struct Assignment {
    let aName: String
    let aWeight: Double
    let grades: [Grade]
}

struct Grade {
    let gName: String
    let score: Double
}




