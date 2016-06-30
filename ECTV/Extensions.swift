//
//  Extensions.swift
//  ECTV
//
//  Created by Harrison Ferrone on 4/6/16.
//  Copyright © 2016 Harrison Ferrone. All rights reserved.
//

import Foundation
import UIKit

public extension UIView {
    
    func fadeInImage() {
        UIView.animateWithDuration(Constants.Integers.fadeTime) { () -> Void in
            self.alpha = 1.0
        }
    }
}

public extension UIAlertController {
    func showAlert(title : String, message: String, vc: UIViewController) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .Alert)
        let cancelAction = UIAlertAction(title: "Gotcha", style: .Cancel, handler: nil)
        alertController.addAction(cancelAction)
        vc.presentViewController(alertController, animated: true, completion: nil)
    }
}
