//
//  UIViewController+Alert.swift
//  hwk16_Burger
//
//  Created by Kyzu on 6.03.22.
//

import Foundation
import UIKit

extension UIViewController {
    static func addAlert(numberOfButtons: Int) -> UIAlertController{
        let alert = UIAlertController(title: "Alert", message: "hwk16", preferredStyle: .alert)
        let okButton = UIAlertAction(title: "OK", style: .default, handler: nil)
        let cancelButton = UIAlertAction(title: "exit", style: .cancel, handler: nil)
        alert.addAction(okButton)
        if numberOfButtons == 2 {
            alert.addAction(cancelButton)
        }
        return alert
    }
}
