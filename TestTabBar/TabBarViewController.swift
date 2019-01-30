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
        
        let screensize = UIScreen.main.bounds
        let screensizeWidth = screensize.width
        
        let imageHomeButtonWidth = setButtonSize(buttonWidth: 0.2)
        let imageProfileButtonWidth = setButtonSize(buttonWidth: 0.4)

        // Dev can select tab bar color
        container.backgroundColor = .red
        
        let imageHomeButton = UIButton()

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
        setDefaultFrame(imageView: imageHomeView, button:imageHomeButton , image: homeImage)
        
        /*if(imageHomeView.frame.maxX > imageHomeButton.frame.size.width || imageHomeView.frame.minX < 0) {
            imageHomeView.frame = CGRect(x: (imageHomeButton.frame.size.width) - 70, y: 0, width: (homeImage?.size.width)!, height: (homeImage?.size.height)!)
            
            print("image view is not inside button, default value assigned")
        } else {
            print("image view size ok")
        }*/
        
        let imageProfileButton = UIButton()
        imageProfileButton.backgroundColor = .orange
        
        let profileImage = UIImage(named: "profile")
        let imageProfileView = UIImageView(image: profileImage)
        imageProfileView.backgroundColor = .brown
        imageProfileView.image = profileImage
        
        imageProfileButton.frame = CGRect(x: (imageHomeButton.frame.size.width) + 0.1, y: 0, width: imageProfileButtonWidth, height: 50)
        imageProfileView.frame = CGRect(x: 50, y: 0, width: (profileImage?.size.width)!, height: (profileImage?.size.height)!)

        setDefaultFrame(imageView: imageProfileView, button: imageProfileButton, image: profileImage)
        
        imageHomeButton.addSubview(imageHomeView)
        imageProfileButton.addSubview(imageProfileView)
        container.addSubview(imageHomeButton)
        container.addSubview(imageProfileButton)
        
        imageHomeButton.addTarget(self, action: #selector(clickButton), for: .touchUpInside)
        
        //Add container to view
        self.view.addSubview(container)
        
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
            50)
        
        NSLayoutConstraint.activate([horizontalConstraint, verticalConstraint, widthConstaint, heightConstaint])
    }
    public func setButtonSize(buttonWidth: CGFloat) -> CGFloat {
        let screensizeWidth = UIScreen.main.bounds.width
        
        return screensizeWidth * buttonWidth
    }
    
    public func setDefaultFrame(imageView: UIImageView, button: UIButton, image: UIImage?) {
        if(imageView.frame.maxX > button.frame.size.width || imageView.frame.minX < 0) {
            imageView.frame = CGRect(x: (button.frame.size.width) - 70, y: 0, width: (image?.size.width)!, height: (image?.size.height)!)
            
            print("image view is not inside button, default value assigned")
        } else {
            print("image view size ok")
        }
    }
    
    @objc public func clickButton(_sender: UIButton)  {
        print("button clicked")
    }
}
