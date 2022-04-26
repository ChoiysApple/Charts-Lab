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
        
        let BarItem = BarViewController()
        BarItem.tabBarItem = UITabBarItem(title: "Bar Chart", image: UIImage(systemName: "chart.bar"), selectedImage: UIImage(systemName: "chart.bar.fill"))
                
        let PieItem = PieViewController()
        PieItem.tabBarItem = UITabBarItem(title: "Pie Chart", image: UIImage(systemName: "chart.pie"), selectedImage: UIImage(systemName: "chart.pie.fill"))
        

        self.viewControllers = [BarItem, PieItem]
    }

    //Delegate methods
    func tabBarController(_ tabBarController: UITabBarController, shouldSelect viewController: UIViewController) -> Bool {
        print("Should select viewController: \(viewController.title ?? "") ?")
        return true
    }
    
}
