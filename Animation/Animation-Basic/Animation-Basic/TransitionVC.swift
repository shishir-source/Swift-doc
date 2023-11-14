//
//  TransitionVC.swift
//  Animation-Basic
//
//  Created by Poka TM on 10/11/23.
//

import UIKit
//
//class TransitionVC: UIViewController {
//    
//    let topImage: UIImageView = {
//        let image = UIImageView()
//        image.image = UIImage(named: "img")
//        image.translatesAutoresizingMaskIntoConstraints = false
//        return image
//    }()
//    
//    let tableTitles = ["Table 1", "Table 2", "Table 3"]
//    
//    let tableView = UITableView()
//    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        
//        // Do any additional setup after loading the view.
//        
//        view.backgroundColor = .white
//        
//        view.addSubview(topImage)
//        topImage.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
//        topImage.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
//        topImage.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
//        topImage.heightAnchor.constraint(equalToConstant: view.frame.size.width).isActive = true
//        topImage.alpha = 0
//        
//    }
//    
//    override func viewWillAppear(_ animated: Bool) {
//        for title in tableTitles {
//            createTable(title: title)
//        }
//        imageViewAnimation()
//    }
//    
//    
//    func createTable(title: String) {
//        // Create a table view
//        
//        
//        // Set the delegate and data source
//        tableView.alpha = 0
//        tableView.delegate = self
//        tableView.dataSource = self
//        
//        // Register your custom cell class if needed
//        // tableView.register(YourCustomCellClass.self, forCellReuseIdentifier: "CellIdentifier")
//        
//        // Set a tag or any other identifier to distinguish tables
//        tableView.tag = tableTitles.firstIndex(of: title) ?? 0
//        
//        // Add the table view to the view hierarchy
//        view.addSubview(tableView)
//        
//        // Set constraints for the table view (adjust this according to your layout requirements)
//        tableView.translatesAutoresizingMaskIntoConstraints = false
//        NSLayoutConstraint.activate([
//            tableView.topAnchor.constraint(equalTo: topImage.bottomAnchor, constant: 30),
//            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
//            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
//            tableView.heightAnchor.constraint(equalToConstant: 200)
//        ])
//        
//        // Create a label for the title and add it as a header view
//        let titleLabel = UILabel()
//        titleLabel.text = title
//        titleLabel.textAlignment = .center
//        tableView.tableHeaderView = titleLabel
//        
//        // Reload the data to display the table
//        
//        
//    }
//    
//    
//    func imageViewAnimation() {
//        topImage.alpha = 0
//        // Animate the image view
//        UIView.animate(withDuration: 1, animations: {
//            self.topImage.alpha = 1
//
//        }, completion: {_ in
//            UIView.animate(withDuration: 0.5) {
//                self.tableView.alpha = 1
//                self.tableView.reloadData()
//            }
//        })
//        
//    }
//    
//    
//    
//}
//
//extension TransitionVC:  UITableViewDelegate, UITableViewDataSource {
//    
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        // Return the number of rows in each table
//        return 10
//    }
//    
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        // Configure your cells here
//        let cell = UITableViewCell(style: .default, reuseIdentifier: "CellIdentifier")
//        cell.textLabel?.text = "Row \(indexPath.row + 1)"
//        return cell
//    }
//    
//    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt inexPath: IndexPath) {
//        cell.alpha = 0
//        UIView.animate(withDuration: 0.5, delay: 0.5*Double(inexPath.row) ,animations: {
//            cell.alpha = 1
//        })
//    }
//}

import UIKit
import UIKit

class TransitionVC: UIViewController {

    let redView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .red
        return view
    }()

    let greenView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .green
        return view
    }()
    
    let leftButton = UIButton(type: .system)
    let rightButton = UIButton(type: .system)
    
    var buttonBGView = UIView()

    let padding: CGFloat = 100
    
    var bgButtonLayout: NSLayoutConstraint!

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.addSubview(redView)
        view.addSubview(greenView)
        view.addSubview(buttonBGView)

        // Set initial state for the red and green views
        NSLayoutConstraint.activate([
            redView.topAnchor.constraint(equalTo: view.topAnchor),
            redView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: padding),
            redView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            redView.widthAnchor.constraint(equalToConstant: view.frame.width - (2 * padding)),

            greenView.topAnchor.constraint(equalTo: view.topAnchor),
            greenView.leadingAnchor.constraint(equalTo: redView.trailingAnchor, constant: padding),
            greenView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            greenView.widthAnchor.constraint(equalToConstant: view.frame.width - (2 * padding))
        ])

        buttonBGView.backgroundColor = .blue
        buttonBGView.translatesAutoresizingMaskIntoConstraints = false
        
        // Add left and right buttons
 
        leftButton.setTitle("Left", for: .normal)
        leftButton.addTarget(self, action: #selector(leftButtonPressed), for: .touchUpInside)
        leftButton.translatesAutoresizingMaskIntoConstraints = false
        leftButton.layer.borderColor = UIColor.black.cgColor
        view.addSubview(leftButton)
        


       
        rightButton.setTitle("Right", for: .normal)
        rightButton.addTarget(self, action: #selector(rightButtonPressed), for: .touchUpInside)
        rightButton.translatesAutoresizingMaskIntoConstraints = false
        rightButton.layer.borderColor = UIColor.black.cgColor
        view.addSubview(rightButton)
        
        
        buttonBGView.heightAnchor.constraint(equalToConstant: 50).isActive = true
        buttonBGView.widthAnchor.constraint(equalToConstant: 100).isActive = true
        buttonBGView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
       
        
        bgButtonLayout = buttonBGView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: padding)
        bgButtonLayout.isActive = true
        
        NSLayoutConstraint.activate([
            leftButton.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            leftButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: padding),
            leftButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: padding),
            leftButton.heightAnchor.constraint(equalToConstant: 50),
            leftButton.widthAnchor.constraint(equalToConstant: 100),

            rightButton.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            rightButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -padding),
            rightButton.heightAnchor.constraint(equalToConstant: 50),
            rightButton.widthAnchor.constraint(equalToConstant: 100),
        ])
        

    }

    @objc func leftButtonPressed() {
        UIView.animate(withDuration: 0.5) {
            self.redView.frame.origin.x = self.padding
            self.greenView.frame.origin.x = self.redView.frame.maxX + self.padding
            
        }
        
        UIView.animate(withDuration: 0.5) {
            self.buttonBGView.frame.origin.x = self.leftButton.frame.minX
        }
    }

    @objc func rightButtonPressed() {
        UIView.animate(withDuration: 0.5) {
            self.redView.frame.origin.x = -self.view.frame.width + self.padding
            self.greenView.frame.origin.x = self.padding
            
        }
        
        UIView.animate(withDuration: 0.5) {
            self.buttonBGView.frame.origin.x = self.rightButton.frame.minX
        }
    }
}
