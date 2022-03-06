//
//  Task1VC.swift
//  hwk16_Burger
//
//  Created by Kyzu on 5.03.22.
//

import UIKit

class Task1VC: UIViewController {
    private var isBurgerHidden = true
    private var burgerButton = UIButton()
    private var imView: UIImageView!
    private var burgerView: UIView!
    private var blurView: UIVisualEffectView!
    
    override func loadView() {
        let customView = UIView(frame: UIScreen.main.bounds)
        customView.backgroundColor = .white
        view = customView
        imView = UIImageView(image: UIImage(named: "swift"))
        
        burgerButton = UIButton.burgerButton()
        burgerButton.addTarget(self, action: #selector(showBurgerView), for: .touchUpInside)
        
        burgerView = createBurgerView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        burgerButton.center = view.center
        view.addSubview(imView)
        view.addSubview(burgerButton)
    }
    
    override func viewWillLayoutSubviews() {
        setElements()
    }
    
    private func setElements() {
        imView.translatesAutoresizingMaskIntoConstraints = false
        burgerButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            burgerButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            burgerButton.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor),
            burgerButton.widthAnchor.constraint(equalToConstant: burgerButton.frame.width),
            burgerButton.heightAnchor.constraint(equalToConstant: burgerButton.frame.height),
            
            imView.widthAnchor.constraint(equalTo: view.widthAnchor ),
            imView.heightAnchor.constraint(equalToConstant: 400),
            imView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            imView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
        ])
    }
    
    private func createBurgerView() -> UIView{
        let bView = UIView()
        bView.backgroundColor = .systemYellow
        bView.layer.cornerRadius = 25
        bView.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMaxXMaxYCorner]
        let swipeToLeft = UISwipeGestureRecognizer(target: self, action: #selector(showBurgerView))
        swipeToLeft.direction = .left
        bView.addGestureRecognizer(swipeToLeft)
        return bView
    }
    
    private func addAlertButton() {
        let alert1Button = UIButton.burgerItemButton(label: "alert 1")
        let alert2Button = UIButton.burgerItemButton(label: "alert 2")
        let backButton = UIButton.burgerItemButton(label: "to main")
        
        burgerView.addSubview(alert1Button)
        burgerView.addSubview(alert2Button)
        burgerView.addSubview(backButton)
        
        alert2Button.center = CGPoint(x: burgerView.bounds.midX, y: burgerView.bounds.midY)
        alert1Button.center = CGPoint(x: burgerView.bounds.midX, y: burgerView.bounds.midY-50)
        backButton.center = CGPoint(x: burgerView.bounds.midX, y: burgerView.bounds.midY+50)
        
        alert1Button.addTarget(self, action: #selector(showAlert1), for: .touchUpInside)
        alert2Button.addTarget(self, action: #selector(showAlert2), for: .touchUpInside)
        backButton.addTarget(self, action: #selector(toMain), for: .touchUpInside)
    }
    
    private func addBlurEffect() {
        let blurEffect = UIBlurEffect(style: .dark)
        blurView = UIVisualEffectView(effect: blurEffect)
        blurView.frame = view.bounds
        blurView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        view.insertSubview(blurView, belowSubview: burgerView)
    }
    
    @objc private func showBurgerView() {
        if isBurgerHidden {
            view.insertSubview(burgerView, belowSubview: burgerButton)
            burgerView.frame = CGRect(origin: CGPoint(x: 0 - view.frame.width * 0.4, y: view.safeAreaLayoutGuide.layoutFrame.minY) , size: CGSize(width: view.frame.width * 0.4, height: view.safeAreaLayoutGuide.layoutFrame.size.height))
            addAlertButton()
            addBlurEffect()
            self.burgerButton.setImage(UIImage(named: "burger_on"), for: .normal)
            UIView.animate(withDuration: 0.75, animations: {
                self.burgerView.frame.origin = CGPoint(x: self.view.safeAreaLayoutGuide.layoutFrame.minX, y: self.view.safeAreaLayoutGuide.layoutFrame.minY)
                self.burgerButton.isUserInteractionEnabled = false
            }, completion: {_ in
                self.burgerButton.isUserInteractionEnabled = true
            })
        } else {
            self.burgerButton.setImage(UIImage(named: "burger_off"), for: .normal)
            UIView.animate(withDuration: 0.75, animations: {
                self.burgerView.frame.origin = CGPoint(x: 0 - self.view.frame.width * 0.4, y: self.view.safeAreaLayoutGuide.layoutFrame.minY)
                self.burgerButton.isUserInteractionEnabled = false
            }, completion: {_ in
                self.burgerView.removeFromSuperview()
                self.blurView.removeFromSuperview()
                self.burgerButton.isUserInteractionEnabled = true
            } )
        }
        self.isBurgerHidden.toggle()
    }
    
    @objc func showAlert1(buttons: Int) {
        let alert = UIViewController.addAlert(numberOfButtons: 1)
        present(alert, animated: true, completion: nil)
    }
    
    @objc func showAlert2(buttons: Int) {
        let alert = UIViewController.addAlert(numberOfButtons: 2)
        present(alert, animated: true, completion: nil)
    }
    
    @objc private func toMain() {
        self.dismiss(animated: true, completion: nil)
    }
    
}
