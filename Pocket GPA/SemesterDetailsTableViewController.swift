//
//  SemesterDetailsTableViewController.swift
//  Pocket GPA
//
//  Created by Justice Jubilee on 2/19/19.
//  Copyright © 2019 Justice Jubilee. All rights reserved.
//

import UIKit

class SemesterDetailsTableViewController: UITableViewController {
    
    var selectedClass: Int!
    
     var deleteIcon: UIImage = #imageLiteral(resourceName: "deleteIcon")
    
    override func viewDidAppear(_ animated: Bool) { //reloads for 
        tableView.reloadData()
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
        return 1;
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return classes.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SemesterDetailsCell", for: indexPath) as! SemesterDetailsTableViewCell

        let currentClass = classes[indexPath.row]
        //cell.textLabel?.text = currentClass.name;
        cell.subjectNameLabel.text = currentClass.name
        cell.letterGradeLabel.text = currentClass.letterGrade
        cell.subjectCreditsLabel.text = String(currentClass.credits)
        
        return cell
    }
    
     func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath, titleForHeaderInSection section: Int) -> String? {

        let currentClass = classes[indexPath.row]
        return currentClass.name
        
    }
    //trailing swipe configuration - to delete cell
    override func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        //selectedClass = indexPath.row;
        print(semesterGPA)
        let delete = deleteAction(at: indexPath);
        
        
        
        return UISwipeActionsConfiguration(actions: [delete])
        
    }
    
    //deleteaAction helper -- removes subject
    func deleteAction(at indexPath: IndexPath) -> UIContextualAction {
        let action = UIContextualAction(style: .destructive, title: "Delete") { (action, view, completion) in
            classes.remove(at: indexPath.row)
            self.tableView.deleteRows(at: [indexPath], with: .automatic)
            completion(true)
        }
        
        //action.image = #imageLiteral(resourceName: "deleteIcon")
        action.title = "Delete";
        action.backgroundColor = .red
        
        //updateSemesterGPA()
        return action
        
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) { //cell tapped
        selectedClass = indexPath.row;
        //print(selectedClass)
        
         self.performSegue(withIdentifier: "subjectTapped", sender: self)
    }
    
    @IBAction func addSubject(_ sender: Any) {
        self.performSegue(withIdentifier: "addSubject", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "addSubject" {
            guard let destinationViewController = segue.destination as? AddSubjectViewController
                else{
                    return
            }
            updateSemesterGPA()
            print(semesterGPA)
        }
        if segue.identifier == "subjectTapped" {
            guard let destinationViewController = segue.destination as? SubjectDetailsTableViewController
                else{
                    return
                }
            
            updateSemesterGPA()
            destinationViewController.currentSubjectIndex = selectedClass
        }
    }

    //*/

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
