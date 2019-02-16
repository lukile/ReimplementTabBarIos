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
    
    //commentaire test
    
    // private let <= const
    private var container: UIViewController?
    private var position: Position?
    private var bgColor: UIColor?
    private var buttons = [UIButton]()
    private var numberButtons = [Int]()
    private var arrayButtonDeleted: [UIButton] = []
    private var tableView: UITableView!
    
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
        
        //definePosition(position: Position.LEFT)
        self.backgroundColor = .white

        /*defineButtons()
        
        for(button in buttons) {
            self.addSubview(button)
        }*/
        
    }
    
    public func definePosition(position: Position) -> Position {
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
                make.size.equalTo(CGSize(width: 60, height: screensizeHeight))
                make.top.equalTo(self)
                make.bottom.equalTo(self)
                make.right.equalTo(self)
            }
        case .LEFT:
            contentView.snp.makeConstraints { (make) -> Void in
                make.size.equalTo(CGSize(width: 60, height: screensizeHeight))
                make.top.equalTo(self)
                make.bottom.equalTo(self)
                make.left.equalTo(self)
            }
        //default:
          //  position = position.BOTTOM
        }
        return position
    }
    
    public func selectNumberOfButton(numberButton: Int) -> [UIButton] {
        for _ in 1...numberButton {
            buttons.append(UIButton())
        }
        
        self.addButtonToTabBar(sizeTabBar: screensizeWidth)
        
        return buttons
        
    }
    
    private func changePlaceButton() {
        guard let lastButton = self.buttons.last else {
            return;
        }
        let imageMore = UIImage(named: "more")
        let buttonMore: UIButton = UIButton()
        guard let frameButtonMore = self.buttons.last?.frame else { return }
        buttonMore.frame = frameButtonMore
        buttonMore.setImage(imageMore, for: .normal)
        buttonMore.addTarget(self, action:#selector(TabBar.buttonMore(_:)), for: .touchUpInside)
        self.buttons.removeLast()
        self.buttons.append(buttonMore)
        self.arrayButtonDeleted.insert(lastButton, at: 0)
        
        for button in self.buttons {
            self.contentView.addSubview(button)
        }
    }
    
    private func setTableView() {
        tableView = UITableView(frame: CGRect(x: 150, y: 200, width: 150, height: 300))
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "MyCell")
        tableView.dataSource = self
        //myTableView.delegate = self
        tableView.backgroundColor = UIColor.gray.withAlphaComponent(0.1)
        tableView.isHidden = true
        self.addSubview(tableView)
    }
    
    @objc public func buttonMore(_ sender:UIButton!)  {
        self.tableView.isHidden = !self.tableView.isHidden
    }

    
    public func chooseSizeButton(buttons: [UIButton], position: Position, sizeButtons: CGFloat...) {
        
       // var position = Position.self
        var gap: CGFloat = 0.0
        var count: Int = 0
        var addBullshit: CGFloat = 0.0
        
        if position == .BOTTOM || position == .TOP {
            for button in buttons {
                let previousButton = buttons.before(button)
                
                button.frame = CGRect(x: (previousButton?.frame.size.width ?? 0) + gap + addBullshit, y: 0, width: ceil(setButtonSizeWidth(buttonWidth: sizeButtons[count])), height: 50)
                
                print("width ", ceil(setButtonSizeWidth(buttonWidth: sizeButtons[count])))
                print("x ", gap)
                
                gap = 0.1
                count += 1
                addBullshit += previousButton?.frame.size.width ?? 0

                buttons[0].backgroundColor = .yellow
                buttons[1].backgroundColor = .orange
                buttons[2].backgroundColor = .purple
                buttons[3].backgroundColor = .brown

                contentView.addSubview(button)
            }
            
       } else if position == .RIGHT || position == .LEFT {
            for button in buttons {
                let previousButton = buttons.before(button)
               
                print("previous : ", previousButton?.frame.height)
                print("gap : ", gap)
                
                 button.frame = CGRect(x: 0, y: previousButton?.frame.height ?? 20 + gap, width: 60, height: setButtonHeight(buttonHeight: sizeButtons[count]))
                
                print("height : ", button.frame.height)

                
                gap = 0.1
                
                count += 1
                buttons[0].backgroundColor = .yellow
                buttons[1].backgroundColor = .orange
                buttons[2].backgroundColor = .purple
                buttons[3].backgroundColor = .brown
                buttons[4].backgroundColor = .green
                buttons[5].backgroundColor = .cyan

                
                contentView.addSubview(button)
            }
            print("button 2 : ", buttons[1].frame.height)
        }
    }
    
    public func addImageView(buttons: [UIButton], position: Position, icone: String...){
        var count: Int = 0
        if position == .BOTTOM || position == .TOP {
            var gap: CGFloat = 0.0

            for button in buttons {
                let previous = buttons.before(button)
                
                print ("previous : ", previous!.frame.size.width as CGFloat)
                
                let buttonWidth = button.frame.size.width
                let image = UIImage(named: icone[count])
                let imageView = UIImageView(image: image)
                imageView.image = image
              
                imageView.frame = CGRect(x: buttonWidth + gap, y: 0, width: (image?.size.width)!, height: 50)
                
                setDefaultWidthFrame(imageView: imageView, button: button, image: image)
                button.addSubview(imageView)

                gap += 0.1
                
             
                count += 1
            }
        } else if position == .LEFT || position == .RIGHT {
            var gap: CGFloat = 0.0
            
            for button in buttons {
                let previousButton = buttons.before(button)
                
                print("previous : ", previousButton?.frame.height)
                
                let image = UIImage(named: icone[count])
                let imageView = UIImageView(image: image)
                imageView.image = image
                
                imageView.frame = CGRect(x: 0, y: previousButton?.frame.height ?? -20 + gap, width: 60, height: (image?.size.height)!)
                
                setDefaultHeightFrame(imageView: imageView, buttonHeight: previousButton?.frame.height ?? 20, image: image)
                
                button.addSubview(imageView)
                
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
    
    private func addButtonToTabBar(sizeTabBar: CGFloat) -> [UIButton] {
        var sizeButton: CGFloat = 0
        var i: Int = 0
        for _ in 0..<self.buttons.count {
            self.buttons[i].frame = CGRect(x: 0, y: 0, width: 100, height: 50)
            sizeButton += self.buttons[i].frame.size.width
            if(sizeButton > sizeTabBar) {
                self.arrayButtonDeleted.append(self.buttons[i])
                if let index = self.buttons.index(of: self.buttons[i]) {
                    self.buttons.remove(at: index)
                    i = index
                }
            } else {
                i += 1
            }
        }
        self.changePlaceButton()
        self.setTableView()
        return self.buttons
    }
    
    public func fixWidthButton(button: UIButton, width: CGFloat) {
        let imageButtonWidth = setButtonSize(buttonWidth: width)
        button.frame = CGRect(x: 0, y: 0, width:imageButtonWidth, height: 50)
    }
    
    private func setButtonSize(buttonWidth: CGFloat) -> CGFloat {
        let screensizeWidth = UIScreen.main.bounds.width
        
        return screensizeWidth * buttonWidth
    }
    
    public func setBackgroundColor(color: UIColor?) {
        self.bgColor = color
    }
    
    private func setDefaultWidthFrame(imageView: UIImageView, button: UIButton, image: UIImage?) {
        if(imageView.frame.maxX > button.frame.size.width || imageView.frame.minX < 0) {
            imageView.frame = CGRect(x: 0, y: 0, width: button.frame.size.width, height: (image?.size.height)!)
            
            print("image view is not inside button, default value assigned")
        } else {
            print("image view size ok")
        }
    }
    
    private func setDefaultHeightFrame(imageView: UIImageView, buttonHeight: CGFloat, image: UIImage?) {
        if(imageView.frame.maxY > buttonHeight || imageView.frame.minY < 0) {
            imageView.frame = CGRect(x: 0, y: buttonHeight - 50, width: 60, height: (image?.size.height)!)
            
            print("image view is not inside button, default value assigned")
        } else {
            print("image view size ok")
        }
    }
}

extension BidirectionalCollection where Iterator.Element: Equatable {
    typealias Element = Self.Iterator.Element
    
    func before(_ item: Element, loop: Bool = false) -> Element? {
        if let itemIndex = self.index(of: item) {
            let firstItem: Bool = (itemIndex == startIndex)
            if loop && firstItem {
                return self.last
            } else if firstItem {
                return nil
            } else {
                return self[index(before:itemIndex)]
            }
        }
        return nil
    }
}

extension TabBar: UITableViewDataSource{
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.arrayButtonDeleted.count
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MyCell", for: indexPath as IndexPath)
        if indexPath.row < self.arrayButtonDeleted.count {
            cell.contentView.addSubview(self.arrayButtonDeleted[indexPath.row])
        } else {
            print("no view at index")
        }
        cell.backgroundColor = UIColor.gray.withAlphaComponent(0)
        return cell
    }
}
