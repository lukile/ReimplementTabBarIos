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
        let position = tabBar.definePosition(position: Position.LEFT)
        let buttons = tabBar.selectNumberOfButton(numberButton: 7)
        tabBar.chooseSizeButton(buttons: buttons, position: position, sizeButtons: 0.2, 0.2, 0.2, 0.2, 0.2, 0.1, 0.3)
        //tabBar.setColorButton(red: 0.4, green: 0.1, blue: 0.2, alpha: 0.5, buttons: buttons)
        tabBar.addImageView(buttons: buttons, position: position, icone: "search", "info", "profile", "folder", "settings", "home", "info")

    }
    
    override public func loadView() {
        self.view = TabBar(frame: UIScreen.main.bounds)
    }
    
    override public func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        tabBar.isLandscape()
    }
    
}
