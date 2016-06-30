//
//  ViewController.swift
//  ECTV
//
//  Created by Harrison Ferrone on 3/28/16.
//  Copyright © 2016 Harrison Ferrone. All rights reserved.
//

import UIKit
import Alamofire

class MainViewController: UIViewController {
    
    @IBOutlet var slideshowView: UIView!
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var startDateLabel: UILabel!
    @IBOutlet var endDateLabel: UILabel!
    @IBOutlet var descriptionTextView: UITextView!
    
    var slideStep = 0
    var eventItemArray = [CalendarItem]()
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        populateViewWithEventData(eventItemArray[slideStep])
        
        //attachmentImageView.image = UIImage(data: NSData(contentsOfURL: NSURL(string: "http://googledrive.com/host/0B_itDYe5kA-1SHhDN3ZCRDl1dUU/51cb4c8b3b283.jpg")!)!)
    }
        
    override func viewDidLoad() {
        super.viewDidLoad()
        self.initializeSlideshowTimer()
    }
    
    func initializeSlideshowTimer() {
        _ = NSTimer.scheduledTimerWithTimeInterval(15, target: self, selector: #selector(MainViewController.initializeSlideshow), userInfo: nil, repeats: true)
    }
    
    func populateViewWithEventData(calendarItem: CalendarItem) {
        titleLabel.text = calendarItem.title
        descriptionTextView.text = calendarItem.description
        startDateLabel.text = calendarItem.eventDate
        endDateLabel.text = "\(calendarItem.startTime) - \(calendarItem.endTime)"
    }
    
    func initializeSlideshow() {
        if slideStep == self.eventItemArray.count {
            slideStep = 0
        }
        
        self.fadeOutImage(slideshowView)
    }
    
    func fadeOutImage(view: UIView) {
        UIView.animateWithDuration(1, animations: { () -> Void in
            self.slideshowView.alpha = 0.0
            
        }) { (complete) -> Void in
            self.slideshowView.fadeInImage()
            var index = self.slideStep + 1
            self.populateViewWithEventData(self.eventItemArray[index])
        }
    }
}

