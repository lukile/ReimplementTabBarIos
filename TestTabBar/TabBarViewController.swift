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
        
        let imageButtonWidth = screensize.width * 0.2
        
        // Dev can select tab bar color
        container.backgroundColor = .red
        
        let imageButton = UIButton()
        imageButton.backgroundColor = .yellow
        //Dev can choose UIImage set on UIImageView
        let homeImage = UIImage(named: "home")
        let imageView = UIImageView(image: homeImage)
        imageView.backgroundColor = .blue
        
        imageView.image = homeImage
        
        //Dev can choose width button
        imageButton.frame = CGRect(x: 0, y: 0,  width: imageButtonWidth, height: 50)
        
        //Dev can choose position of UIIMageView by x value
        //Eventually change width if icon is too big or small -> in this case respect original
        //image width and height
        imageView.frame = CGRect(x: 20, y: 0, width: (homeImage?.size.width)!, height: (homeImage?.size.height)!)
        //Determine if imageView is inside button or not
        if(imageView.frame.maxX > imageButton.frame.size.width || imageView.frame.minX < 0) {
            imageView.frame = CGRect(x: (imageButton.frame.size.width) - 70, y: 0, width: (homeImage?.size.width)!, height: (homeImage?.size.height)!)
            
            print("image view is not inside button, default value assigned")
        } else {
            print("image view size ok")
        }
        
        imageButton.addSubview(imageView)
        container.addSubview(imageButton)
        
        imageButton.addTarget(self, action: Selector(("clickButton:")), for: .touchUpInside)
        
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
    public func clickButton(_sender: UIButton)  {
        print("button clicked")
    }
}
