//
//  AdjustableTabBar.swift
//  Poker Ios
//
//  Created by Chu Hoang Hai on 2020/12/07.
//

import UIKit

class AdjustableTabBarController: UITabBarController  {
    
    var inputController: InputController!
    
    var _1stTabControllers: [UIViewController]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func openResultScreen(hands: [HandResponse]){
        var arrChildViewControllers = self.children
        var  replacement: UIViewController = UIViewController()
        if arrChildViewControllers.count > 0 {
            
            let selectedTabIndex = self.selectedIndex
            let previousVC = arrChildViewControllers[0]
            
            
            //open Result screen
            let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
            let resultController = storyBoard.instantiateViewController(withIdentifier: "ResultController") as! ResultController
            resultController.hands += hands
            
            replacement = resultController
            inputController = previousVC as? InputController
            
            
            arrChildViewControllers.replaceSubrange(selectedTabIndex...selectedTabIndex, with: [replacement])
            
            self.viewControllers = arrChildViewControllers
        }
    }
    
    func setSelectedViewController() {
       
        var arrChildViewControllers = self.children
        if arrChildViewControllers.count > 0 {
            
            let selectedTabIndex = self.selectedIndex
            
            arrChildViewControllers.replaceSubrange(selectedTabIndex...selectedTabIndex, with: [inputController])
            
            self.viewControllers = arrChildViewControllers
        }

    }


}
