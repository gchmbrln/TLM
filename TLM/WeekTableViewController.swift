//
//  WeekTableViewController.swift
//
//  TLM - Tennis League Matches - Show Matches for the Week
//
//  Created by Gary Chamberlain on 6/5/15.
//  Copyright (c) 2015 Gary Chamberlain. All rights reserved.
//

import UIKit

class WeekTableViewController: UITableViewController {

// Connect to Navigation Date and Team Labels
  
  @IBOutlet weak var dateOfMatches: UINavigationItem!
  
  @IBOutlet weak var team1Label: UILabel!
  @IBOutlet weak var team2Label: UILabel!
  @IBOutlet weak var team3Label: UILabel!
  @IBOutlet weak var team4Label: UILabel!
  @IBOutlet weak var team5Label: UILabel!
  @IBOutlet weak var team6Label: UILabel!
  
// Some Varaibales
  
  var team1, team2, team3, team4, team5, team6: String?
  
// Some Constants

// ........................................................................

  override func viewDidLoad() {
    
    super.viewDidLoad()

// update team placeholder string with actual team player names

    team1Label.text = team1
    team2Label.text = team2
    team3Label.text = team3
    team4Label.text = team4
    team5Label.text = team5
    team6Label.text = team6
  
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
  }

// ........................................................................

    // MARK: - Table view data source

    /*
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("reuseIdentifier", forIndexPath: indexPath) as! UITableViewCell

        // Configure the cell...

        return cell
    }
    */

    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return NO if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return NO if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */

}
