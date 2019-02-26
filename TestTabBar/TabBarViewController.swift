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
        tabBar.setColorButton(red: 0.4, green: 0.1, blue: 0.2, alpha: 0.5)
        tabBar.setButtonColorPressed(red: 0.1, green: 0.1, blue: 0.4, alpha: 0.2)
        let position = tabBar.definePosition(position: Position.BOTTOM)
        let buttons = tabBar.selectNumberOfButton(numberButton: 9)
        tabBar.chooseSizeButton(buttons: buttons, position: position, sizeButtons: 0.3, 0.2, 0.2, 0.1, 0.2, 0.1, 0.3, 0.2, 0.1)
      
        tabBar.addImageView(buttons: buttons, position: position, icone: "search", "info", "profile", "folder", "settings", "home", "param", "reddit", "swift")

    }
    
    override public func loadView() {
        self.view = TabBar(frame: UIScreen.main.bounds)
    }
    
    override public func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        tabBar.isLandscape()
    }
    
}
