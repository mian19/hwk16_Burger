//
//  UIButton+taskButton.swift
//  hwk16_Burger
//
//  Created by Kyzu on 5.03.22.
//

import Foundation
import UIKit

extension UIButton {
    
   static func taskButton () -> UIButton {
       let button = UIButton()
       button.backgroundColor = .blue
       button.frame.size = CGSize(width: 150, height: 80)
       button.setTitle("Task 1", for: .normal)
       button.titleLabel!.font = UIFont(name: "AppleSDGothicNeo-Thin", size: 45)
       button.setTitleColor(.white, for: .normal)
       return button
   }
    
    static func burgerButton () -> UIButton {
        let button = UIButton()
        button.frame.size = CGSize(width: 30, height: 30)
        button.setImage(UIImage(named: "burger_off"), for: .normal)
        return button
    }

    static func burgerItemButton (label: String) -> UIButton {
        let button = UIButton()
        button.backgroundColor = .blue
        button.frame.size = CGSize(width: 90, height: 40)
        button.titleLabel!.font = UIFont(name: "System", size: 25)
        button.setTitleColor(.white, for: .normal)
        button.setTitle(label, for: .normal)
        return button
    }
    
}
