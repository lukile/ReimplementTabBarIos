//
//  TabBarViewController.swift
//  TestTabBar
//
//  Created by lukile on 26/01/2019.
//  Copyright © 2019 lukile. All rights reserved.
//

import UIKit

public class TabBarViewController: UIViewController {
    var tabBar: TabBar { return self.view as! TabBar}
    
  
    override public func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white
    
        tabBar.setTabBarColor(color: .blue)
        let position = tabBar.definePosition(position: Position.TOP)
        let buttons = tabBar.selectNumberOfButton(numberButton: 7)
        tabBar.chooseSizeButton(buttons: buttons, position: position, sizeButtons: 0.2, 0.1, 0.3, 0.2, 0.2, 0.1, 0.3)
        
        tabBar.addImageView(buttons: buttons, position: position, icone: "home", "info", "profile", "folder", "settings", "home", "info")

    }
    
    override public func loadView() {
        self.view = TabBar(frame: UIScreen.main.bounds)
    }
    
    override public func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        tabBar.isLandscape()
    }
    
}
