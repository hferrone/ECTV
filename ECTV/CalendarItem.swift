//
//  CalendarItem.swift
//  ECTV
//
//  Created by Harrison Ferrone on 4/6/16.
//  Copyright © 2016 Harrison Ferrone. All rights reserved.
//

import Foundation

class CalendarItem {
 
    private var _title: String!
    private var _description: String!
    private var _eventDate: String!
    private var _startTime: String!
    private var _endTime: String!
    private var _attachment: String!
    
    var title: String {
        return _title
    }
    
    var description: String {
        return _description
    }
    
    var eventDate: String {
        return _eventDate
    }
    
    var startTime: String {
        return _startTime
    }
    
    var endTime: String {
        return _endTime
    }
    
    var attachment: String {
         return _attachment
    }
    
    init(eventDict: NSDictionary) {
        self._title = eventDict["summary"] as! String
        self._eventDate = eventDict["start"]?.objectForKey("date") as! String
        self._startTime = eventDict["start"]?.objectForKey("time") as! String
        self._endTime = eventDict["end"]?.objectForKey("time") as! String
        
        if let descriptionMessage = eventDict["description"] {
            self._description = descriptionMessage as! String
        } else {
            self._description = "No Description Available"
        }
    }
}
