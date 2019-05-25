//
//  Details+SegmentControl.swift
//  appdb
//
//  Created by ned on 05/03/2017.
//  Copyright © 2017 ned. All rights reserved.
//

import UIKit
import Cartography

protocol SwitchDetailsSegmentDelegate: class {
    func segmentSelected(_ state: detailsSelectedSegmentState)
}

enum detailsSelectedSegmentState: String {
    case details = "Details"
    case reviews = "Reviews"
    case download = "Download"
}

class DetailsSegmentControl: TableViewHeader {
    
    var segment: UISegmentedControl!
    var items: [detailsSelectedSegmentState] = []
    weak var delegate: SwitchDetailsSegmentDelegate?
    
    func index(for state: detailsSelectedSegmentState) -> Int {
        switch state {
            case .details: return 0
            case .reviews: return 1
            case .download: return items.contains(.reviews) ? 2 : 1
        }
    }
    
    static var height: CGFloat { return 45 }
    
    convenience init(_ items: [detailsSelectedSegmentState], state: detailsSelectedSegmentState, enabled: Bool, delegate: SwitchDetailsSegmentDelegate) {
        self.init(frame: .zero)
        
        self.items = items
        self.delegate = delegate

        preservesSuperviewLayoutMargins = false
        layoutMargins.left = 0
        contentView.backgroundColor = .clear
        addSeparator(full: true)
        
        // Setting the background color on UITableViewHeaderFooterView has been deprecated.
        // So i set a custom UIView with desired background color to the backgroundView property.
        let bgColorView = UIView()
        bgColorView.backgroundColor = .clear
        backgroundView = bgColorView
        
        segment = UISegmentedControl(items: self.items.compactMap{$0.rawValue.localized()})
        segment.selectedSegmentIndex = index(for: state)
        segment.addTarget(self, action: #selector(self.indexDidChange), for: .valueChanged)
        segment.theme_tintColor = Color.informationParameter
        setLinksEnabled(enabled)

        contentView.addSubview(segment)
        
        constrain(segment) { segment in
            
            segment.bottom ~== segment.superview!.bottom ~- 10
            segment.centerX ~== segment.superview!.centerX
            
            if items.contains(.reviews) {
                if Global.isIpad {
                    segment.width ~== 380
                } else {
                    (segment.left ~== segment.superview!.left ~+ Global.size.margin.value ~+ 5) ~ Global.notMaxPriority
                    (segment.right ~== segment.superview!.right ~- Global.size.margin.value ~- 5) ~ Global.notMaxPriority
                }
            } else {
                segment.width ~== (280~~250)
            }
        }
        
    }
    
    @objc func indexDidChange() {
        delegate?.segmentSelected(items[segment.selectedSegmentIndex])
    }
    
    func setLinksEnabled(_ enabled: Bool) {
        guard let index = items.firstIndex(of: .download) else { return }
        segment.setEnabled(enabled, forSegmentAt: index)
    }
    
}