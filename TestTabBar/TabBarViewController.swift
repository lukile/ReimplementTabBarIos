//
//  TabBarViewController.swift
//  TestTabBar
//
//  Created by under on 26/01/2019.
//  Copyright © 2019 under. All rights reserved.
//

import UIKit

public class TabBarViewController: UIViewController {
    
    /*required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }*/
    //var button: UIBarButtonItem?
    
    override public func viewDidLoad() {
     super.viewDidLoad()
     view.backgroundColor = .white
     launchApp()
     }
    
    public func launchApp(){
        let container = UIView()
        
        container.backgroundColor = .red
        
        //Add container to view
        self.view.addSubview(container)
        
        //topTabBar(container: container)
        
        //bottomTabBar(container: container)
        
        leftTabBar(container: container)
        
        //rightTabBar(container: container)
       
    }
    
    public func setButtonSizeWidth(buttonWidth: CGFloat) -> CGFloat {
        let screensizeWidth = UIScreen.main.bounds.width
        
        return screensizeWidth * buttonWidth
    }
    
    public func setButtonSizeHeight(buttonHeight: CGFloat) -> CGFloat {
        let screensizeHeight = UIScreen.main.bounds.height
        
        return screensizeHeight * buttonHeight
    }
    
    public func setDefaultWidthFrame(imageView: UIImageView, button: UIButton, image: UIImage?) {
        if(imageView.frame.maxX > button.frame.size.width || imageView.frame.minX < 0) {
            imageView.frame = CGRect(x: (button.frame.size.width) - 70, y: 0, width: (image?.size.width)!, height: (image?.size.height)!)
            
            print("image view is not inside button, default value assigned")
        } else {
            print("image view size ok")
        }
    }
    
    public func setDefaultHeightFrame(imageView: UIImageView, button: UIButton, image: UIImage?) {
        if(imageView.frame.maxY > button.frame.size.height || imageView.frame.minY < 0) {
            imageView.frame = CGRect(x: 0, y: (button.frame.size.height) - 100, width: 60, height: (image?.size.height)!)
            
            print("image view is not inside button, default value assigned")
        } else {
            print("image view size ok")
        }
    }
    
    @objc public func clickButton(_sender: UIButton)  {
        print("button clicked")
    }
    
    public func topTabBar(container: UIView, tabBarSize: CGFloat) {
        let imageHomeButton = UIButton()
        
        let imageHomeButtonWidth = setButtonSizeWidth(buttonWidth: 0.2)
        let imageProfileButtonWidth = setButtonSizeWidth(buttonWidth: 0.4)
        
        setTabBarTop(container: container, tabBarSize: tabBarSize)
        
        imageHomeButton.backgroundColor = .yellow
        
        //Dev can choose UIImage set on UIImageView
        let homeImage = UIImage(named: "home")
        let imageHomeView = UIImageView(image: homeImage)
        imageHomeView.backgroundColor = .blue
        imageHomeView.image = homeImage
        
        //Dev can choose width button
        imageHomeButton.frame = CGRect(x: 0, y: 0,  width: imageHomeButtonWidth, height: 50)
        
        //Dev can choose position of UIIMageView by x value
        //Eventually change width if icon is too big or small -> in this case respect original
        //image width and height
        imageHomeView.frame = CGRect(x: 20, y: 0, width: (homeImage?.size.width)!, height: (homeImage?.size.height)!)
        //Determine if imageView is inside button or not
        setDefaultWidthFrame(imageView: imageHomeView, button:imageHomeButton , image: homeImage)
        
        
        let imageProfileButton = UIButton()
        imageProfileButton.backgroundColor = .orange
        
        let profileImage = UIImage(named: "profile")
        let imageProfileView = UIImageView(image: profileImage)
        imageProfileView.backgroundColor = .brown
        imageProfileView.image = profileImage
        
        imageProfileButton.frame = CGRect(x: (imageHomeButton.frame.size.width) + 0.1, y: 0, width: imageProfileButtonWidth, height: 50)
        imageProfileView.frame = CGRect(x: 50, y: 0, width: (profileImage?.size.width)!, height: (profileImage?.size.height)!)
        
        setDefaultWidthFrame(imageView: imageProfileView, button: imageProfileButton, image: profileImage)
        
        imageHomeButton.addSubview(imageHomeView)
        imageProfileButton.addSubview(imageProfileView)
        
        
        imageHomeButton.addTarget(self, action: #selector(clickButton), for: .touchUpInside)
        
        container.addSubview(imageHomeButton)
        container.addSubview(imageProfileButton)
    }
   
    
    public func bottomTabBar(container: UIView) {
        
     let imageHomeButton = UIButton()
     
     let imageHomeButtonWidth = setButtonSizeWidth(buttonWidth: 0.2)
     let imageProfileButtonWidth = setButtonSizeWidth(buttonWidth: 0.4)
     
     setTabBarBottom(container: container, tabBarSize: 50)
        
     imageHomeButton.backgroundColor = .yellow
     
     //Dev can choose UIImage set on UIImageView
     let homeImage = UIImage(named: "home")
     let imageHomeView = UIImageView(image: homeImage)
     imageHomeView.backgroundColor = .blue
     imageHomeView.image = homeImage
     
     //Dev can choose width button
     imageHomeButton.frame = CGRect(x: 0, y: 0,  width: imageHomeButtonWidth, height: 50)
     
     //Dev can choose position of UIIMageView by x value
     //Eventually change width if icon is too big or small -> in this case respect original
     //image width and height
     imageHomeView.frame = CGRect(x: 20, y: 0, width: (homeImage?.size.width)!, height: (homeImage?.size.height)!)
     //Determine if imageView is inside button or not
     setDefaultWidthFrame(imageView: imageHomeView, button:imageHomeButton , image: homeImage)
    
     
     let imageProfileButton = UIButton()
     imageProfileButton.backgroundColor = .orange
     
     let profileImage = UIImage(named: "profile")
     let imageProfileView = UIImageView(image: profileImage)
     imageProfileView.backgroundColor = .brown
     imageProfileView.image = profileImage
     
     imageProfileButton.frame = CGRect(x: (imageHomeButton.frame.size.width) + 0.1, y: 0, width: imageProfileButtonWidth, height: 50)
     imageProfileView.frame = CGRect(x: 50, y: 0, width: (profileImage?.size.width)!, height: (profileImage?.size.height)!)
     
     setDefaultWidthFrame(imageView: imageProfileView, button: imageProfileButton, image: profileImage)
     
     imageHomeButton.addSubview(imageHomeView)
     imageProfileButton.addSubview(imageProfileView)
     
     
     imageHomeButton.addTarget(self, action: #selector(clickButton), for: .touchUpInside)
        
        container.addSubview(imageHomeButton)
        container.addSubview(imageProfileButton)
    
    }
    
    public func leftTabBar(container: UIView) {
        let imageInfoButtonHeight = setButtonSizeHeight(buttonHeight: 0.2)
        let imageSettingsButtonHeight = setButtonSizeHeight(buttonHeight: 0.4)
        
        let tabBarSize = CGFloat(60.0)

        setTabBarToLeft(container: container, tabBarSize: tabBarSize)
        
        let imageInfoButton = UIButton()
        imageInfoButton.backgroundColor = .yellow
        
        let infoImage = UIImage(named: "info")
        let imageInfoView = UIImageView(image: infoImage)
        imageInfoView.backgroundColor = .blue
        imageInfoView.image = infoImage
        
        imageInfoButton.frame = CGRect(x: 0, y: 0, width: tabBarSize, height: imageInfoButtonHeight)
        imageInfoView.frame = CGRect(x: 0, y: 20, width: tabBarSize, height: (infoImage?.size.height)!)
        setDefaultHeightFrame(imageView: imageInfoView, button: imageInfoButton, image: infoImage)
        
        imageInfoButton.addSubview(imageInfoView)
        
        let imageSettingsButton = UIButton()
        imageSettingsButton.backgroundColor = .orange
        
        let settingsImage = UIImage(named: "settings")
        let imageSettingsView = UIImageView(image: settingsImage)
        imageSettingsView.backgroundColor = .brown
        imageSettingsView.image = settingsImage
        
        imageSettingsButton.frame = CGRect(x: 0, y: (imageInfoButton.frame.size.height) + 0.1, width: tabBarSize, height: imageSettingsButtonHeight)
        imageSettingsView.frame = CGRect(x: 0, y: (imageInfoButton.frame.size.height) + 0.1, width: tabBarSize, height: (settingsImage?.size.height)!)
        setDefaultHeightFrame(imageView: imageSettingsView, button: imageSettingsButton, image: settingsImage)
        
        imageSettingsButton.addSubview(imageSettingsView)
        
        container.addSubview(imageInfoButton)
        container.addSubview(imageSettingsButton)
    }
    
    public func rightTabBar(container: UIView) {
        let imageInfoButtonHeight = setButtonSizeHeight(buttonHeight: 0.2)
        let imageSettingsButtonHeight = setButtonSizeHeight(buttonHeight: 0.4)
        
        let tabBarSize = CGFloat(60.0)
        
        setTabBarToRight(container: container, tabBarSize: tabBarSize)
        
        let imageInfoButton = UIButton()
        imageInfoButton.backgroundColor = .yellow
        
        let infoImage = UIImage(named: "info")
        let imageInfoView = UIImageView(image: infoImage)
        imageInfoView.backgroundColor = .blue
        imageInfoView.image = infoImage
        
        imageInfoButton.frame = CGRect(x: 0, y: 0, width: tabBarSize, height: imageInfoButtonHeight)
        imageInfoView.frame = CGRect(x: 0, y: 20, width: tabBarSize, height: (infoImage?.size.height)!)
        setDefaultHeightFrame(imageView: imageInfoView, button: imageInfoButton, image: infoImage)

        imageInfoButton.addSubview(imageInfoView)
        
        let imageSettingsButton = UIButton()
        imageSettingsButton.backgroundColor = .orange
        
        let settingsImage = UIImage(named: "settings")
        let imageSettingsView = UIImageView(image: settingsImage)
        imageSettingsView.backgroundColor = .brown
        imageSettingsView.image = settingsImage
        
        imageSettingsButton.frame = CGRect(x: 0, y: (imageInfoButton.frame.size.height) + 0.1, width: tabBarSize, height: imageSettingsButtonHeight)
        imageSettingsView.frame = CGRect(x: 0, y: (imageInfoButton.frame.size.height) + 0.1, width: tabBarSize, height: (settingsImage?.size.height)!)
        setDefaultHeightFrame(imageView: imageSettingsView, button: imageSettingsButton, image: settingsImage)
        
        imageSettingsButton.addSubview(imageSettingsView)
        
        container.addSubview(imageInfoButton)
        container.addSubview(imageSettingsButton)
    }
    
    public func setTabBarTop(container: UIView, tabBarSize: CGFloat) {
        let screensizeWidth = UIScreen.main.bounds.width
        
        //Add constraints
        container.translatesAutoresizingMaskIntoConstraints = false
        
        //Width is sized to screensize width and fixed automatically to bottom
        let horizontalConstraint = NSLayoutConstraint(item: container, attribute: NSLayoutConstraint.Attribute.centerX, relatedBy: NSLayoutConstraint.Relation.equal, toItem: view, attribute: NSLayoutConstraint.Attribute.centerX, multiplier: 1, constant: 0)
        let verticalConstraint = NSLayoutConstraint(item: container, attribute: NSLayoutConstraint.Attribute.top, relatedBy: NSLayoutConstraint.Relation.equal, toItem: view, attribute: NSLayoutConstraint.Attribute.topMargin, multiplier: 1, constant: 0)
        let widthConstaint = NSLayoutConstraint(item: container, attribute: NSLayoutConstraint.Attribute.width, relatedBy: NSLayoutConstraint.Relation.equal, toItem: nil, attribute:
            NSLayoutConstraint.Attribute.notAnAttribute, multiplier: 1, constant: screensizeWidth)
        let heightConstaint = NSLayoutConstraint(item: container, attribute:
            NSLayoutConstraint.Attribute.height, relatedBy:
            NSLayoutConstraint.Relation.equal, toItem: nil, attribute:
            NSLayoutConstraint.Attribute.notAnAttribute, multiplier: 1, constant:
            tabBarSize)
        
        NSLayoutConstraint.activate([horizontalConstraint, verticalConstraint, widthConstaint, heightConstaint])
        
    }
    
    
    public func setTabBarBottom(container: UIView, tabBarSize: CGFloat) {
        let screensizeWidth = UIScreen.main.bounds.width
        
        //Add constraints
        container.translatesAutoresizingMaskIntoConstraints = false
        
        //Width is sized to screensize width and fixed automatically to bottom
        let horizontalConstraint = NSLayoutConstraint(item: container, attribute: NSLayoutConstraint.Attribute.centerX, relatedBy: NSLayoutConstraint.Relation.equal, toItem: view, attribute: NSLayoutConstraint.Attribute.centerX, multiplier: 1, constant: 0)
        let verticalConstraint = NSLayoutConstraint(item: container, attribute: NSLayoutConstraint.Attribute.bottom, relatedBy: NSLayoutConstraint.Relation.equal, toItem: view, attribute: NSLayoutConstraint.Attribute.bottomMargin, multiplier: 1, constant: 0)
        let widthConstaint = NSLayoutConstraint(item: container, attribute: NSLayoutConstraint.Attribute.width, relatedBy: NSLayoutConstraint.Relation.equal, toItem: nil, attribute:
            NSLayoutConstraint.Attribute.notAnAttribute, multiplier: 1, constant: screensizeWidth)
        let heightConstaint = NSLayoutConstraint(item: container, attribute:
            NSLayoutConstraint.Attribute.height, relatedBy:
            NSLayoutConstraint.Relation.equal, toItem: nil, attribute:
            NSLayoutConstraint.Attribute.notAnAttribute, multiplier: 1, constant:
            tabBarSize)
        
        NSLayoutConstraint.activate([horizontalConstraint, verticalConstraint, widthConstaint, heightConstaint])
        
    }
    
    public func setTabBarToLeft(container: UIView, tabBarSize: CGFloat) {
        let screensize = UIScreen.main.bounds
        
        container.translatesAutoresizingMaskIntoConstraints = false
        
        //item : first item of equation must be either a view or a layout guide
        //attribute 1: attribute to be constrained on the first item
        //relatedBy: relationship between the left and the right side can be : less than, greater than or equals
        //multiplier: value of attribute 2 is multiplied by this number
        //toItem: second item of equation, can be nil
        //attribute 2: attribute being constrained on the second item, if blank -> notAnAttribute
        //constant: offset
        
        
        //Width is sized to screensize width and fixed automatically to bottom
        let horizontalConstraint = NSLayoutConstraint(item: container, attribute: NSLayoutConstraint.Attribute.left, relatedBy: NSLayoutConstraint.Relation.equal, toItem: view, attribute: NSLayoutConstraint.Attribute.left, multiplier: 1, constant: 0)
        let topConstraint = NSLayoutConstraint(item: container, attribute: NSLayoutConstraint.Attribute.top, relatedBy: NSLayoutConstraint.Relation.equal, toItem: view, attribute: NSLayoutConstraint.Attribute.topMargin, multiplier: 2, constant: 0)
        let widthConstaint = NSLayoutConstraint(item: container, attribute: NSLayoutConstraint.Attribute.width, relatedBy: NSLayoutConstraint.Relation.equal, toItem: nil, attribute:
            NSLayoutConstraint.Attribute.notAnAttribute, multiplier: 1, constant: tabBarSize)
        let heightConstaint = NSLayoutConstraint(item: container, attribute:
            NSLayoutConstraint.Attribute.height, relatedBy:
            NSLayoutConstraint.Relation.equal, toItem: nil, attribute:
            NSLayoutConstraint.Attribute.notAnAttribute, multiplier: 1, constant:
            screensize.height * 0.85)
        
        NSLayoutConstraint.activate([horizontalConstraint, topConstraint, widthConstaint, heightConstaint])
    }
    
    public func setTabBarToRight (container: UIView, tabBarSize: CGFloat) {
        let screensize = UIScreen.main.bounds
        
        container.translatesAutoresizingMaskIntoConstraints = false
        
        let horizontalConstraint = NSLayoutConstraint(item: container, attribute: NSLayoutConstraint.Attribute.right, relatedBy: NSLayoutConstraint.Relation.equal, toItem: view, attribute: NSLayoutConstraint.Attribute.right, multiplier: 1, constant: 0)
        let topConstraint = NSLayoutConstraint(item: container, attribute: NSLayoutConstraint.Attribute.top, relatedBy: NSLayoutConstraint.Relation.equal, toItem: view, attribute: NSLayoutConstraint.Attribute.topMargin, multiplier: 2, constant: 0)
        let widthConstaint = NSLayoutConstraint(item: container, attribute: NSLayoutConstraint.Attribute.width, relatedBy: NSLayoutConstraint.Relation.equal, toItem: nil, attribute:
            NSLayoutConstraint.Attribute.notAnAttribute, multiplier: 1, constant: tabBarSize)
        let heightConstaint = NSLayoutConstraint(item: container, attribute:
            NSLayoutConstraint.Attribute.height, relatedBy:
            NSLayoutConstraint.Relation.equal, toItem: nil, attribute:
            NSLayoutConstraint.Attribute.notAnAttribute, multiplier: 1, constant:
            screensize.height * 0.85)
        
        NSLayoutConstraint.activate([horizontalConstraint, topConstraint, widthConstaint, heightConstaint])

    }
}
