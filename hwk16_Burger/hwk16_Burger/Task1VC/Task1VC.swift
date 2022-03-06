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
    
    @objc private func showBurgerView() {
        if isBurgerHidden {
            view.insertSubview(burgerView, belowSubview: burgerButton)
            burgerView.frame = CGRect(origin: CGPoint(x: 0 - view.frame.width * 0.4, y: view.safeAreaLayoutGuide.layoutFrame.minY) , size: CGSize(width: view.frame.width * 0.4, height: view.safeAreaLayoutGuide.layoutFrame.size.height))
            self.burgerButton.setImage(UIImage(named: "burger_on"), for: .normal)
            UIView.animate(withDuration: 1, animations: {
                self.burgerView.frame.origin = CGPoint(x: self.view.safeAreaLayoutGuide.layoutFrame.minX, y: self.view.safeAreaLayoutGuide.layoutFrame.minY)
                self.burgerButton.isUserInteractionEnabled = false
            }, completion: {_ in
                self.burgerButton.isUserInteractionEnabled = true
            })
            
        } else {
            self.burgerButton.setImage(UIImage(named: "burger_off"), for: .normal)
            UIView.animate(withDuration: 1, animations: {
                self.burgerView.frame.origin = CGPoint(x: 0 - self.view.frame.width * 0.4, y: self.view.safeAreaLayoutGuide.layoutFrame.minY)
                self.burgerButton.isUserInteractionEnabled = false
            }, completion: {_ in
                self.burgerView.removeFromSuperview()
                self.burgerButton.isUserInteractionEnabled = true
                
            } )
        }
        self.isBurgerHidden.toggle()
    }
    
    private func createBurgerView() -> UIView{
        var bView = UIView()
        bView.backgroundColor = .systemYellow
        bView.layer.cornerRadius = 25
        bView.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMaxXMaxYCorner]
        return bView
    }
    

    
    


}
