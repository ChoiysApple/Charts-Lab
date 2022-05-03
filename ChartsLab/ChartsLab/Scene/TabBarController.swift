//
//  TabBarController.swift
//  ChartsLab
//
//  Created by Daegeon Choi on 2022/04/26.
//

import UIKit

class TabBarController: UITabBarController, UITabBarControllerDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = .white
        self.delegate = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        let barItem = BarViewController()
        barItem.tabBarItem = UITabBarItem(
            title: "Bar Chart",
            image: UIImage(systemName: "chart.bar"),
            selectedImage: UIImage(systemName: "chart.bar.fill")
        )
                
        let pieItem = PieViewController()
        pieItem.tabBarItem = UITabBarItem(
            title: "Pie Chart",
            image: UIImage(systemName: "chart.pie"),
            selectedImage: UIImage(systemName: "chart.pie.fill")
        )
        
        let progressItem = ProgressViewController()
        progressItem.tabBarItem = UITabBarItem(
            title: "Progress Bar",
            image: UIImage(systemName: "goforward"),
            selectedImage: UIImage(systemName: "goforward")
        )

        self.viewControllers = [barItem, pieItem, progressItem]
    }

    // Delegate methods
    func tabBarController(_ tabBarController: UITabBarController, shouldSelect viewController: UIViewController) -> Bool {
        return true
    }
    
}
