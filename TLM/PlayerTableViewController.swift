//
//  PlayerTableViewController.swift
//
//  TLM - Tennis League Matches - Show Matches for a Player
//
//  Created by Gary Chamberlain on 6/8/15.
//  Copyright (c) 2015 Gary Chamberlain. All rights reserved.
//

import UIKit

class PlayerTableViewController: UITableViewController {
  
// Connect to Navigation Player and Weekly-Player Labels

  @IBOutlet weak var nameOfPlayer: UINavigationItem!

  @IBOutlet weak var week1Label: UILabel!
  @IBOutlet weak var week2Label: UILabel!
  @IBOutlet weak var week3Label: UILabel!
  @IBOutlet weak var week4Label: UILabel!
  @IBOutlet weak var week5Label: UILabel!
  @IBOutlet weak var week6Label: UILabel!
  @IBOutlet weak var week7Label: UILabel!

// Some Varaibales
  
  var match1, match2, match3, match4, match5, match6, match7: String?
  
// Some Constants
  
// ........................................................................
  
  override func viewDidLoad() {
    
    super.viewDidLoad()
    
// update match placeholder string with actual match player's names
    
    week1Label.text = match1
    week2Label.text = match2
    week3Label.text = match3
    week4Label.text = match4
    week5Label.text = match5
    week6Label.text = match6
    week7Label.text = match7
    
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
