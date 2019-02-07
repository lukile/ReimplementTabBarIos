//
//  TabBarViewController.swift
//  TestTabBar
//
//  Created by under on 26/01/2019.
//  Copyright © 2019 under. All rights reserved.
//

import UIKit

public class TabBarViewController: UIViewController {
    var tabBar: TabBar { return self.view as! TabBar}
    
  
    override public func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
    
        //tabBar.setContainer(container: self)
        tabBar.setTabBarColor(color: .blue)
        tabBar.definePosition(position: Position.LEFT)
        let buttons = tabBar.selectNumberOfButton(numberButton: 2)
        tabBar.chooseSizeButton(buttons: buttons, sizeButtons: 0.2, 0.3)
        tabBar.addImageView(buttons: buttons, icone: "home", "profile")
        //tabBar.addButtonToTabBar(buttons: buttons)
        

    
        //self.view.addSubview(tabBar)

    }
    
    override public func loadView() {
        self.view = TabBar(frame: UIScreen.main.bounds)
    }
    
}
