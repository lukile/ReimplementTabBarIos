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
    private var position = Position.self
    private var bgColor: UIColor?
    private var buttons = [UIButton]()
    private var numberButtons = [Int]()
    
    let screensizeWidth = UIScreen.main.bounds.width
    let screensizeHeight = UIScreen.main.bounds.height

    
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
        
        definePosition(position: Position.LEFT)
        self.backgroundColor = .white

        /*defineButtons()
        
        for(button in buttons) {
            self.addSubview(button)
        }*/
        
    }
    
    public func definePosition(position: Position) {
        let screensizeHeight = UIScreen.main.bounds.height
        
        switch position {
        case .BOTTOM:
            contentView.snp.makeConstraints { (make) -> Void in
                make.size.equalTo(CGSize(width: screensizeWidth, height: 50))
                make.left.right.equalTo(self)
                make.bottom.equalTo(self).offset(-20)
            }
        case .TOP:
            contentView.snp.makeConstraints { (make) -> Void in
                make.size.equalTo(CGSize(width: screensizeWidth, height: 50))
                make.left.right.equalTo(self)
                make.top.equalTo(self).offset(60)
            }
        case .RIGHT:
            contentView.snp.makeConstraints { (make) -> Void in
                make.size.equalTo(CGSize(width: 50, height: screensizeHeight))
                make.top.equalTo(self)
                make.bottom.equalTo(self)
                make.right.equalTo(self)
            }
        case .LEFT:
            contentView.snp.makeConstraints { (make) -> Void in
                make.size.equalTo(CGSize(width: 50, height: screensizeHeight))
                make.top.equalTo(self)
                make.bottom.equalTo(self)
                make.left.equalTo(self)
            }
        //default:
          //  position = position.BOTTOM
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
        
        var position = Position.self
        
        var gap: CGFloat = 0.0
        var n: CGFloat = 0.0
        var count: Int = 0
        if position == .BOTTOM || position == .TOP {
            if sizeButtons.count > buttons.count {
                print("Too many values")
            }
            for button in buttons {
                buttons[0].backgroundColor = .yellow
                buttons[1].backgroundColor = .orange

                button.frame = CGRect(x: n + gap, y: 0, width: setButtonSizeWidth(buttonWidth: sizeButtons[count]), height: 50)
                
                print("width ", setButtonSizeWidth(buttonWidth: sizeButtons[count]))
                print("x ", n + gap)
                
                
                n = button.frame.size.width
                
                gap = 0.1
                
                count += 1
                contentView.addSubview(button)
            }
        } else if position == .RIGHT || position == .LEFT {
            for button in buttons {
                buttons[0].backgroundColor = .yellow
                buttons[1].backgroundColor = .orange
                
                 button.frame = CGRect(x: 0, y: n + gap, width: 60, height: setButtonHeight(buttonHeight: sizeButtons[count]))
                
                n = button.frame.size.height
                
                gap = 0.1
                
                count += 1
                contentView.addSubview(button)
            }
        }
    }
    
    public func addImageView(buttons: [UIButton], icone: String...){
        var count: Int = 0
        if position == .BOTTOM || position == .TOP {
            for button in buttons {
                let image = UIImage(named: icone[count])
                let imageView = UIImageView(image: image)
                imageView.image = image
                
                imageView.frame = CGRect(x: 20, y: 0, width: (image?.size.width)!, height: (image?.size.height)!)
                
                button.addSubview(imageView)
                
                count += 1
            }
        } else if position == .LEFT || position == .RIGHT {
            var yValue: CGFloat = 20
            var gap: CGFloat = 0.0
            
            for button in buttons {

                let image = UIImage(named: icone[count])
                let imageView = UIImageView(image: image)
                imageView.image = image
                
                imageView.frame = CGRect(x: 0, y: yValue + gap, width: 60, height: (image?.size.height)!)
                
                button.addSubview(imageView)
                
                yValue = button.frame.size.height
                
                gap += 0.1
                
                count += 1
            }
        }
    }
    
    private func setButtonSizeWidth(buttonWidth: CGFloat) -> CGFloat {
        return screensizeWidth * buttonWidth
    }
    
    private func setButtonHeight(buttonHeight: CGFloat) -> CGFloat {
        return screensizeHeight * buttonHeight
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
    
    //public func setPosition(position: Position) {
      //  self.position = position
    //}
    
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
