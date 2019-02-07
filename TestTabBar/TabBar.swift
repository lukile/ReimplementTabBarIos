//
//  TabBar.swift
//  TestTabBar
//
//  Created by under on 31/01/2019.
//  Copyright © 2019 under. All rights reserved.
//

import Foundation
import UIKit
import SnapKit

public class TabBar : UIView {
    
    // private let <= const
    private var container: UIViewController?
    private var position: Position = Position.BOTTOM
    private var bgColor: UIColor?
    private var buttons = [UIButton]()
    private var numberButtons = [Int]()
    
    let screensizeWidth = UIScreen.main.bounds.width

    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupViews() {
        self.addSubview(contentView)
    }
    
    let contentView: UIView = {
        let screensize = UIScreen.main.bounds
        
        let view = UIView()
       
        view.layer.borderWidth = 1.0
        view.layer.borderColor = UIColor.lightGray.cgColor
        
        return view
    }()
    
    public func setTabBarColor(color: UIColor) {
        contentView.backgroundColor = color
    }
   
    public func setContainer(container: UIViewController) {
        self.container = container
    }
    
    public func build() {
        // container must not be null to continue
        
        definePosition()
        self.backgroundColor = .white

        /*defineButtons()
        
        for(button in buttons) {
            self.addSubview(button)
        }*/
        
    }
    
    public func definePosition() {
        //let screensizeHeight = UIScreen.main.bounds.height
        
        /*Right
            contentView.snp.makeConstraints { (make) -> Void in
                make.size.equalTo(CGSize(width: 50, height: screensizeHeight))
                make.top.equalTo(self)
                make.bottom.equalTo(self)
                make.right.equalTo(self)
            }*/
 
        /*Top
            contentView.snp.makeConstraints { (make) -> Void in
            make.size.equalTo(CGSize(width: screensizeWidth, height: 50))
            make.left.right.equalTo(self)
            make.top.equalTo(self).offset(60)
        }*/
        
        /*  Left
            contentView.snp.makeConstraints { (make) -> Void in
            make.size.equalTo(CGSize(width: 50, height: screensizeHeight))
            make.top.equalTo(self)
            make.bottom.equalTo(self)
            make.left.equalTo(self)
        }*/
        

            contentView.snp.makeConstraints { (make) -> Void in
            make.size.equalTo(CGSize(width: screensizeWidth, height: 50))
            make.left.right.equalTo(self)
            make.bottom.equalTo(self).offset(-20)
        }
    }
    
    public func selectNumberOfButton(numberButton: Int) -> [UIButton] {
        for _ in 1...numberButton {
            buttons.append(UIButton())
            numberButtons.append(numberButton)
        }
        return buttons
    }
    
    public func chooseSizeButton(buttons: [UIButton], sizeButtons: CGFloat...) {
        if sizeButtons.count > buttons.count {
            print("Too many values")
        }
        for sizeButton in sizeButtons {
            for button in buttons {
                button.frame = CGRect(x: 0, y: 0, width: setButtonSizeWidth(buttonWidth: sizeButton), height: 50)
                contentView.addSubview(button)
            }
        }
    }
    
    private func setButtonSizeWidth(buttonWidth: CGFloat) -> CGFloat {
        return screensizeWidth * buttonWidth
    }
    
    public func addButtonToTabBar(buttons: [UIButton]) {
        for button in buttons {
            button.backgroundColor = .yellow
            
            button.frame = CGRect(x: 0, y: 0, width: 50, height: 50)
            
            contentView.addSubview(button)
        }
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
