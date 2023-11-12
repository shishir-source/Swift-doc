//
//  ViewController.swift
//  Animation-Basic
//
//  Created by Poka TM on 10/11/23.
//

import UIKit

class ViewController: UIViewController {
    
    let pressBtn: UIButton = {
        let btn = UIButton()
        btn.setTitle("Press", for: .normal)
        btn.backgroundColor = .black
        btn.translatesAutoresizingMaskIntoConstraints = false
        return btn
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        view.addSubview(pressBtn)
        pressBtn.heightAnchor.constraint(equalToConstant: 50).isActive = true
        pressBtn.widthAnchor.constraint(equalToConstant: 150).isActive = true
        
        pressBtn.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        pressBtn.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        
        pressBtn.addTarget(self, action: #selector(pressbtnPressed(_:)), for: .touchUpInside)
    }
    
    
    override func viewDidLayoutSubviews() {
        pressBtn.layer.cornerRadius = 10
    }

    // Ease in and Out
    
    @objc func pressbtnPressed(_ sender: UIButton) {
        let vc = TransitionVC()
        self.present(vc, animated: true)
    }
}

