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
    private var buttons = [UIButton]()
    
    override public init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    
    required init?(coder aDecoder: NSCoder) { fatalError("init(coder:) has not been implemented"); }

    
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
    
    public func addButton(button: UIButton) {
        buttons.append(button)
    }
    
    public func fixWidthButton(button: UIButton, width: CGFloat) {
        let imageButtonWidth = setButtonSize(buttonWidth: width)
        button.frame = CGRect(x: 0, y: 0, width:imageButtonWidth, height: 50)
    }
    
    private func setButtonSize(buttonWidth: CGFloat) -> CGFloat {
        let screensizeWidth = UIScreen.main.bounds.width
        
        return screensizeWidth * buttonWidth
    }
    
    public func addImageToImageView(imageName: String) {
        let image = UIImage(named: imageName)
        let imageView = UIImageView(image: image)
        imageView.image = image
    }
    
    public func setImageViewPosition(imageView: UIImageView, xValue: CGFloat, image: UIImage){
        
        let imageWidth = image.size.width
        let imageHeight = image.size.height
        
        imageView.frame = CGRect(x: xValue, y: 0, width: imageWidth, height: imageHeight)
    }
    
    public func setPosition(position: Position) {
        self.position = position
    }
    
    public func setBackgroundColor(color: UIColor?) {
        self.bgColor = color
    }
    
    public func setDefaultFrame(imageView: UIImageView, button: UIButton, image: UIImage?) {
        if(imageView.frame.maxX > button.frame.size.width || imageView.frame.minX < 0) {
            imageView.frame = CGRect(x: (button.frame.size.width) - 70, y: 0, width: (image?.size.width)!, height: (image?.size.height)!)
            
            print("image view is not inside button, default value assigned")
        } else {
            print("image view size ok")
        }
    }
}

extension NSCoder {
    class func empty() -> NSCoder {
        let data = NSMutableData()
        let archiver = NSKeyedArchiver(forWritingWith: data)
        archiver.finishEncoding()
        return NSKeyedUnarchiver(forReadingWith: data as Data)
    }
}
