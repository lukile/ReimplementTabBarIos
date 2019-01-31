//
//  TabBar.swift
//  TestTabBar
//
//  Created by under on 31/01/2019.
//  Copyright © 2019 under. All rights reserved.
//

import Foundation
import UIKit

public class TabBar : UIView {
    
    // private let <= const
    private weak var container: UIViewController?
    private var position: Position = Position.BOTTOM
    private var bgColor: UIColor?
    //private var buttons: List<UIButton>
    
    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    public func setContainer(container: UIViewController?) {
        self.container = container
    }
    
    public func build() {
        // container must not be null to continue
        
        definePosition()
        /*defineButtons()
        
        for(button in buttons) {
            self.addSubview(button)
        }*/
        
        self.backgroundColor = bgColor
        container!.view.addSubview(self)
    }
    
    /*public func addButton(button: UIButton) {
        buttons.add(button)
    }*/
    
    public func setPosition(position: Position) {
        self.position = position
    }
    
    public func setBackgroundColor(color: UIColor?) {
        self.bgColor = color
    }
    
    private func definePosition() {
        self.translatesAutoresizingMaskIntoConstraints = false
        // TODO : change constraint depending on setPosition call
        
        //Width is sized to screensize width and fixed automatically to bottom
        let horizontalConstraint = NSLayoutConstraint(item: self, attribute: NSLayoutConstraint.Attribute.centerX, relatedBy: NSLayoutConstraint.Relation.equal, toItem: container, attribute: NSLayoutConstraint.Attribute.centerX, multiplier: 1, constant: 0)
        let verticalConstraint = NSLayoutConstraint(item: self, attribute: NSLayoutConstraint.Attribute.bottom, relatedBy: NSLayoutConstraint.Relation.equal, toItem: container, attribute: NSLayoutConstraint.Attribute.bottomMargin, multiplier: 1, constant: 0)
        
        let screensizeWidth = UIScreen.main.bounds.width
        let widthConstaint = NSLayoutConstraint(item: self, attribute: NSLayoutConstraint.Attribute.width, relatedBy: NSLayoutConstraint.Relation.equal, toItem: nil, attribute:
            NSLayoutConstraint.Attribute.notAnAttribute, multiplier: 1, constant: screensizeWidth)
        let heightConstaint = NSLayoutConstraint(item: self, attribute:
            NSLayoutConstraint.Attribute.height, relatedBy:
            NSLayoutConstraint.Relation.equal, toItem: nil, attribute:
            NSLayoutConstraint.Attribute.notAnAttribute, multiplier: 1, constant:
            50)
        
        NSLayoutConstraint.activate([horizontalConstraint, verticalConstraint, widthConstaint, heightConstaint])
    }
}
