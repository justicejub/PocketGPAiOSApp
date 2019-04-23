//
//  SubjectDetailsTableViewController.swift
//  Pocket GPA
//
//  Created by Justice Jubilee on 3/23/19.
//  Copyright © 2019 Justice Jubilee. All rights reserved.
//

import UIKit

class SubjectDetailsTableViewController: UITableViewController {

    var currentSubjectIndex: Int!
    var selectedAssignment: Int!
    
    override func viewDidAppear(_ animated: Bool) { //reloads for
        tableView.reloadData()
        updateSubjectGPA(subjectIndex: currentSubjectIndex);
        updateSubjectLetterGrade(subjectIndex: currentSubjectIndex);
        updateSemesterGPA()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return classes[currentSubjectIndex].assignments.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SubjectDetailsCell", for: indexPath) as! SubjectDetailsTableViewCell
        
        let currentAssignment = classes[currentSubjectIndex].assignments[indexPath.row]
        cell.assignmentName.text = currentAssignment.aName
        cell.aWeightLabel.text = String(currentAssignment.aWeight) + "%"
        cell.aGrade.text = String(currentAssignment.totalScore * 100) + "%"
        return cell
    }
    
    //trailing swipe configuration - to delete cell
    override func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {

        let delete = deleteAction(at: indexPath);
        return UISwipeActionsConfiguration(actions: [delete])
    }
    
    //deleteaAction helper -- removes subject
    func deleteAction(at indexPath: IndexPath) -> UIContextualAction {
        let action = UIContextualAction(style: .destructive, title: "Delete") { (action, view, completion) in
            classes[self.currentSubjectIndex].assignments.remove(at: indexPath.row)
            self.tableView.deleteRows(at: [indexPath], with: .automatic)
            completion(true)
            
        }
        
        //action.image = #imageLiteral(resourceName: "deleteIcon")
        action.title = "Delete";
        action.backgroundColor = .red
        
        return action
    }
    
    
    
    
    @IBAction func addAssignmentTapped(_ sender: Any) { //add (+) tapped
        self.performSegue(withIdentifier: "addAssignment", sender: self)
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) { //cell tapped
        selectedAssignment = indexPath.row;
        self.performSegue(withIdentifier: "assignmentTapped", sender: self)
        
        updateSubjectGPA(subjectIndex: currentSubjectIndex);
        updateSubjectLetterGrade(subjectIndex: currentSubjectIndex);
        updateSemesterGPA()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "addAssignment" {
            guard let destinationViewController = segue.destination as? AddAssignmentViewController
                else {
                    return
            }
            
            updateSubjectGPA(subjectIndex: currentSubjectIndex);
            updateSubjectLetterGrade(subjectIndex: currentSubjectIndex);
            updateSemesterGPA()

            destinationViewController.currentSubjectIndex = currentSubjectIndex
            
            
        }
        
        if segue.identifier == "assignmentTapped" {
            guard let destinationViewController = segue.destination as? AssignmentDetailsTableViewController
                else {
                    return
                }
            
            updateSubjectGPA(subjectIndex: currentSubjectIndex);
            updateSubjectLetterGrade(subjectIndex: currentSubjectIndex);
            updateSemesterGPA()
            
            destinationViewController.currentAssignmentIndex = selectedAssignment
            destinationViewController.currentSubjectIndex = currentSubjectIndex
        }
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
