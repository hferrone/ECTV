//
//  Server.swift
//  ECTV
//
//  Created by Harrison Ferrone on 4/27/16.
//  Copyright © 2016 Harrison Ferrone. All rights reserved.
//

import Foundation
import UIKit
import Alamofire

let eventsEndpoint = "https://ectv.firebaseio.com/events.json"

class Server {
    
    static let sharedInstance = Server()
    
    func fetchEventData(completion: (result: NSArray) -> Void) {
        Alamofire.request(.GET, eventsEndpoint)
            .responseJSON { (response) in
                let responseJSON = response.result.value as? NSArray
                completion(result: responseJSON!)
        }
    }
}
