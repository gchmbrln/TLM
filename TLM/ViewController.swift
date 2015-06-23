//
//  ViewController.swift
//
//  TLM - Tennis League Matches
//
//  Created by Gary Chamberlain on 6/4/15.
//  Copyright (c) 2015 Gary Chamberlain. All rights reserved.
//

import UIKit

// constants for global use (i.e., EditPlayerTableViewControler)

  let numberOfPlayers = 12, numberOfWeeks = 7, numberOfMonths = 12

  let playersNamesID = ["P1", "P2", "P3", "P4", "P5", "P6",
                        "P7", "P8", "P9", "P10", "P11", "P12"]

// ........................................................................

class ViewController: UIViewController {

// Connect to Weekly Date Buttons

  var allWeekButtons = [DesignableButton]()
  
  @IBOutlet weak var buttonW1: DesignableButton!
  @IBOutlet weak var buttonW2: DesignableButton!
  @IBOutlet weak var buttonW3: DesignableButton!
  @IBOutlet weak var buttonW4: DesignableButton!
  @IBOutlet weak var buttonW5: DesignableButton!
  @IBOutlet weak var buttonW6: DesignableButton!
  @IBOutlet weak var buttonW7: DesignableButton!

// Connect to Player Buttons

  var allPlayerButtons = [DesignableButton]()

  @IBOutlet weak var buttonP1: DesignableButton!
  @IBOutlet weak var buttonP2: DesignableButton!
  @IBOutlet weak var buttonP3: DesignableButton!
  @IBOutlet weak var buttonP4: DesignableButton!
  @IBOutlet weak var buttonP5: DesignableButton!
  @IBOutlet weak var buttonP6: DesignableButton!
  @IBOutlet weak var buttonP7: DesignableButton!
  @IBOutlet weak var buttonP8: DesignableButton!
  @IBOutlet weak var buttonP9: DesignableButton!
  @IBOutlet weak var buttonP10: DesignableButton!
  @IBOutlet weak var buttonP11: DesignableButton!
  @IBOutlet weak var buttonP12: DesignableButton!

// Define Some Variables

  var weekSelected: Int?, playerSelected: Int?
  
// USPTA Round-Robin Format (12 player, 7 week daw)
  
  let drawOrderByWeek = [
    [ 1,  2, 3,  4,   5,  6,  7,  8,   9, 10, 11, 12 ],
    [ 3,  6, 7, 10,   1,  4,  9, 12,   2, 11,  5,  8 ],
    [ 4, 11, 7, 12,   2,  9,  3,  8,   1,  6,  5, 10 ],
    [ 3, 10, 5, 12,   1,  8,  2,  7,   4,  9,  6, 11 ],
    [ 1, 10, 8, 11,   3, 12,  6,  9,   2,  5,  4,  7 ],
    [ 1, 12, 6,  7,   4,  5, 10, 11,   2,  3,  8,  9 ],
    [ 2,  6, 3, 11,   7,  9,  8, 10,   1,  5,  4, 12 ] ]

// Player Data

  let playersNamesData = [
    "Blas Mazzeo",     "Brian Lee",     "Eric Loose",    "Gary Chamberlain",
    "Jason Mayling",   "Jose Alamillo", "Kevin Capen",   "Matt DeCelle",
    "Michael Wronski", "Ricardo Diaz",  "Steve Sylvers", "Tony Morro" ]

  var playersNames = Array(count: 12, repeatedValue: String())  // sorted array of names

//                         NumColumns=Teams                NumRows=Weeks
  var teamPlayerNames = Array(count: 6, repeatedValue: Array(count: 7, repeatedValue: String()))

//                           Players                         Weeks
  var myMatchPlayers = Array(count: 12, repeatedValue: Array(count: 7, repeatedValue: String()))

// Player Draw Order

//let playerDrawOrder = [1, 6, 3, 8, 12, 2, 10, 5, 11, 9, 7, 4]  // Jun-Aug 2015
//let playerDrawOrder = [7, 2, 8, 11, 3, 9, 6, 12, 1, 10, 4, 5]  // Apr-Jun 2015
  var playerDrawOrder = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12]  // debug order
  
// Week Data
  
  let firstPlayDate = "Jun 22"  // Jun-Aug 2015
  var holidayWeeklyOffset = [0, 0 ,0 ,0 ,0 ,0 ,0]

  var weekDateData = Array(count: 7, repeatedValue: String())

// ........................................................................

  override func viewDidLoad() {
    super.viewDidLoad()
  }
  
  func loadMyAppStartView() {
    
    var player, playerRandom, playerSorted, weekNumber : Int
    
    // ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    // ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    //
    // Change boolean to "true" if any new players
    //
    // ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    // ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    
    let newPlayersUpdate:Bool = false  // 'true' if a new player; 'false' to use data in NSUserDefaults
    
    if (newPlayersUpdate == true) {  // save array 'playersNamesData'
      
      for player in 0..<numberOfPlayers {
        NSUserDefaults.standardUserDefaults().setObject(playersNamesData[player], forKey: playersNamesID[player])
      }

    } else {  // use date from NSUserDefaults
      
      for player in 0..<numberOfPlayers {
        playersNames[player] = NSUserDefaults.standardUserDefaults().objectForKey(playersNamesID[player])as! String
      }
      
      // get the new draw order from the randomized player list
      
      for player in 0..<numberOfPlayers {
        
        playerDrawOrder[player] = -1
        
        for playerRandom in 0..<numberOfPlayers {
          if (playersNamesData[player] == playersNames[playerRandom]) {
            playerDrawOrder[player] = playerRandom + 1
            break
          }
        }
        
      }
      
    }
    
    // ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    // ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    
    // create weekly date button array and change titles to week date
    
    matchDates(firstPlayDate)
    
    allWeekButtons.extend([buttonW1, buttonW2, buttonW3,
                           buttonW4, buttonW5, buttonW6, buttonW7])
    
    for button in allWeekButtons {
      button.setTitle(weekDateData[button.tag], forState: UIControlState.Normal)
    }
    
    // create player button array and change titles to players names
    
    allPlayerButtons.extend([buttonP1, buttonP2,  buttonP3,  buttonP4,
                             buttonP5, buttonP6,  buttonP7,  buttonP8,
                             buttonP9, buttonP10, buttonP11, buttonP12])
    
    for button in allPlayerButtons {
//    var newTitle = "\(playerDrawOrder[button.tag])" + " " + playersNamesData[button.tag]
//    button.setTitle(newTitle, forState: UIControlState.Normal)
      button.setTitle(playersNamesData[button.tag], forState: UIControlState.Normal)
    }
    
    // create re-orderd player list based on player draw order
    
    for player in 0..<numberOfPlayers {
      playersNames[playerDrawOrder[player]-1] = playersNamesData[player]
    }
    
    // create team matches for all weeks
    
    for weekNumber in 0..<numberOfWeeks {
      displayWeeklyDraw(weekNumber)
    }
    
    // create player matches for all players for all weeks
    
    for player in 0..<numberOfPlayers {
      playerSorted = playerDrawOrder[player]
      displayPlayerDraw(player, playerSorted:playerSorted)
    }
    
  }
  
  func displayWeeklyDraw (weekNumber: Int) {

    // create team matches for this week

    var court, player, index, offset, nextTeam: Int
    var thisTeamPlayerName = Array(count: 4, repeatedValue: String())

    for court in 0...2 {

      offset = 4*court
      nextTeam = 2*court

      for player in 0...3 {
        index = player + offset
        thisTeamPlayerName[player] = playersNames[drawOrderByWeek[weekNumber][index]-1]
      }

      teamPlayerNames[nextTeam][weekNumber]   = thisTeamPlayerName[0] + " / " + thisTeamPlayerName[1]
      teamPlayerNames[nextTeam+1][weekNumber] = thisTeamPlayerName[2] + " / " + thisTeamPlayerName[3]

    }

  }

  func displayPlayerDraw (playerNumber: Int, playerSorted: Int) {

    // create player matches for this players for all weeks

    var week, index, player, ith: Int
    var drawOrder = Array(count: 12, repeatedValue:Int())
    var matchPlayers = Array(count: 4, repeatedValue:String())
    var fullName, partialStr: String

    for week in 0..<numberOfWeeks {
      
      var courtID = -1

      for player in 0..<numberOfPlayers {
        drawOrder[player] = drawOrderByWeek[week][player]
        if drawOrder[player] == playerSorted {
          courtID = player / 4
        }
      }

      for player in 0...3 {
        index = 4*courtID + player
        fullName = playersNames[drawOrder[index]-1]
        var fullNameArr = split(fullName) {$0 == " "}
        var firstName: String = fullNameArr[0]
        matchPlayers[player] = firstName
      }

      partialStr = weekDateData[week] + ":  "
      partialStr = partialStr + matchPlayers[0] + " / " + matchPlayers[1] + "   vs   "
      partialStr = partialStr + matchPlayers[2]  + " / " + matchPlayers[3]
      myMatchPlayers[playerNumber][week] = partialStr

    }

  }
  
  func matchDates (firstPlayDate: String) {

    // create match dates
    
    let monthNames = ["Jan", "Feb", "Mar", "Apr", "May", "Jun",
                      "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"]
    
    let daysPerMonth = [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]

    var daysPerMonthSum = [Int](count: 12, repeatedValue: 0)
    
    var month, doy, dayCount, playDate : Int
    
    var fullDate = split(firstPlayDate) {$0 == " "}
    var startMonth = fullDate[0]
    var startDay = fullDate[1].toInt()
    
    // create cumlative number of days by month
    
    daysPerMonthSum[0] = daysPerMonth[0]
    
    for month in 1..<numberOfMonths {
      daysPerMonthSum[month] = daysPerMonthSum[month-1] + daysPerMonth[month]
    }
    
    // determine nunber of days to start date
    
    doy = 0

    for month in 0..<numberOfMonths {
      if (startMonth != monthNames[month]) {
        doy = doy + daysPerMonth[month]
      } else {
        doy = doy + startDay!
        break
      }
    }
    
    // determine the 7 dates of play
    
    weekDateData[0] = firstPlayDate
    
    for playDate in 1..<numberOfWeeks {
      
      doy = doy + 7 + holidayWeeklyOffset[playDate]
      dayCount = doy
      
      for month in 0..<numberOfMonths {
        dayCount = dayCount - daysPerMonth[month]
        if (dayCount < 0) {
          weekDateData[playDate] = monthNames[month] + " " + String(dayCount + daysPerMonth[month])
          break
        }
      }

    }

  }
  
  @IBAction func weekButtonTapped(sender: AnyObject) {

    weekSelected = sender.tag
    performSegueWithIdentifier("showMatchesSegue", sender: self)

  }

  @IBAction func playerButtonTapped(sender: DesignableButton) {

    playerSelected = sender.tag
    performSegueWithIdentifier("showPlayerSegue", sender: self)

  }
 
  override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
    
    if segue.identifier == "showMatchesSegue" {

      let destinationVC = segue.destinationViewController as! WeekTableViewController

      destinationVC.dateOfMatches.title = "Match Date: " + weekDateData[weekSelected!]

      destinationVC.team1 = teamPlayerNames[0][weekSelected!]
      destinationVC.team2 = teamPlayerNames[1][weekSelected!]
      destinationVC.team3 = teamPlayerNames[2][weekSelected!]
      destinationVC.team4 = teamPlayerNames[3][weekSelected!]
      destinationVC.team5 = teamPlayerNames[4][weekSelected!]
      destinationVC.team6 = teamPlayerNames[5][weekSelected!]
      
    } else if segue.identifier == "showPlayerSegue" {
      
        let destinationVC = segue.destinationViewController as! PlayerTableViewController
      
        destinationVC.nameOfPlayer.title = playersNamesData[playerSelected!]

        destinationVC.match1 = myMatchPlayers[playerSelected!][0]
        destinationVC.match2 = myMatchPlayers[playerSelected!][1]
        destinationVC.match3 = myMatchPlayers[playerSelected!][2]
        destinationVC.match4 = myMatchPlayers[playerSelected!][3]
        destinationVC.match5 = myMatchPlayers[playerSelected!][4]
        destinationVC.match6 = myMatchPlayers[playerSelected!][5]
        destinationVC.match7 = myMatchPlayers[playerSelected!][6]

    } else if segue.identifier == "editPlayersSegue" {
      
        let destinationVC = segue.destinationViewController as! UINavigationController
  
        let destination = destinationVC.viewControllers.first as! EditPlayerTableViewController

        destination.currentPlayers = playersNames
      
    }

  }

  override func viewWillAppear(animated: Bool) {
    
    loadMyAppStartView()
    
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }

}
