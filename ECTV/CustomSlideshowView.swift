//
//  CustomSlideshowView.swift
//  ECTV
//
//  Created by Harrison Ferrone on 4/25/16.
//  Copyright © 2016 Harrison Ferrone. All rights reserved.
//

import UIKit

@IBDesignable class CustomSlideshowView: UIView {

    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var descriptionLabel: UILabel!
    @IBOutlet var startDateLabel: UILabel!
    @IBOutlet var endDateLabel: UILabel!
    
    var view: UIView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        initializeView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    func initializeView() {
        view = loadViewFromNib()
        view.frame = bounds
        view.autoresizingMask = UIViewAutoresizing.FlexibleWidth
        
        addSubview(view)
    }
    
    func loadViewFromNib() -> UIView {
        let bundle = NSBundle(forClass: self.dynamicType)
        let nib = UINib(nibName: "CustomSlideshowView", bundle: bundle)
        let view = nib.instantiateWithOwner(self, options: nil) [0] as! UIView
        
        return view
    }

    func populateEventData(eventItem: CalendarItem) {
        titleLabel.text = eventItem.title
        descriptionLabel.text = eventItem.description
        startDateLabel.text = eventItem.startDate
        endDateLabel.text = eventItem.endDate
    }
}
