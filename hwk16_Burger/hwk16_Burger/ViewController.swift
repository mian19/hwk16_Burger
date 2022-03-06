//
//  ViewController.swift
//  hwk16_Burger
//
//  Created by Kyzu on 5.03.22.
//

import UIKit

class ViewController: UIViewController {
    private var button: UIButton!
    
    override func loadView() {
        let customView = UIView(frame: UIScreen.main.bounds)
        customView.backgroundColor = .systemCyan
        view = customView
        button = UIButton.taskButton()
        view.addSubview(button)
    }
                          
    override func viewDidLoad() {
        super.viewDidLoad()
        button.addTarget(self, action: #selector(nextScreen), for: .touchUpInside)
    }
    
    override func viewWillLayoutSubviews() {
        button.center = view.center
    }
    
    @objc private func nextScreen() {
        let storyboard = UIStoryboard.init(name: "Task1VC", bundle: Bundle.main)
        let vc = storyboard.instantiateInitialViewController() as! Task1VC
        vc.modalPresentationStyle = .fullScreen
        self.present(vc, animated: true, completion: nil)
    }
    
}

