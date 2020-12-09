//
//  AdjustableTabBar.swift
//  Poker Ios
//
//  Created by Chu Hoang Hai on 2020/12/07.
//

import UIKit

class AdjustableTabBarController: UITabBarController  {
    
    func setSelectedViewController(_ externalViewController: UIViewController) {

        var arrChildViewControllers = self.children

        if arrChildViewControllers.count > 0 {

            let selectedTabIndex = self.selectedIndex
            arrChildViewControllers.replaceSubrange(selectedTabIndex...selectedTabIndex, with: [externalViewController])

            self.viewControllers = arrChildViewControllers
        }

    }


}
