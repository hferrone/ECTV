//
//  IntroViewController.swift
//  ECTV
//
//  Created by Harrison Ferrone on 4/27/16.
//  Copyright © 2016 Harrison Ferrone. All rights reserved.
//

import UIKit

class IntroViewController: UIViewController {
    
    var eventItemArray = [CalendarItem]()

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func loadEventsFromFirebase() {
        Server.sharedInstance.fetchEventData { (result) in
            for item in result {
                let eventDict = item as! NSDictionary
                let newEvent = CalendarItem(eventDict: eventDict)
                self.eventItemArray.append(newEvent)
            }
            self.performSegueWithIdentifier(Constants.SegueID.toMainScreen, sender: self)
        }
    }
    
    @IBAction func segueToMainScreen(sender: AnyObject) {
        loadEventsFromFirebase()
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == Constants.SegueID.toMainScreen {
            let mainVC = segue.destinationViewController as! MainViewController
            mainVC.eventItemArray = self.eventItemArray
        }
    }
}
