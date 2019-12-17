//
//  ViewController.swift
//  ChiledViewControllerAsContainers
//
//  Created by Suresh Shiga on 17/12/19.
//  Copyright © 2019 Test. All rights reserved.
//

import UIKit

enum Segues {
   static let toFirstChledVC = "ToFirstChiledVC"
    
}

class ViewController: UIViewController {
    
    let secondChiledVC = SecondChiledVC()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        addSecondChildVC()
    }

    
    //MARK:- Add ViewController as Container Using StoryBoard
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == Segues.toFirstChledVC {
            let destVC = segue.destination as! FirstChildVC
            destVC.view.backgroundColor = .orange
        }
    }
    
    
    //MARK:- Add ViewController as Container Using Coding
    private func addSecondChildVC() {
        addChild(secondChiledVC)
        self.view.addSubview(secondChiledVC.view)
        self.didMove(toParent: self)
        self.secondChiledVC.view.backgroundColor = .red
        setContraintsToSecondChildVC()
    }
    
    //MARK:- Contraints For SecondChildView
    private func setContraintsToSecondChildVC() {
        self.secondChiledVC.view.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            self.secondChiledVC.view.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 20.0),
            self.secondChiledVC.view.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor, constant: -30.0),
            self.secondChiledVC.view.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -20.0),
            self.secondChiledVC.view.heightAnchor.constraint(equalToConstant: 200.0),
            self.secondChiledVC.view.centerXAnchor.constraint(equalTo: self.view.centerXAnchor)
            ])
    }
    

}

