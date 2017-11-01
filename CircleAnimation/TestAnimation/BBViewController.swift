//
//  BBViewController.swift
//  TestAnimation
//
//  Created by xjk on 27/10/2017.
//  Copyright © 2017 xjk. All rights reserved.
//

import UIKit

class BBViewController: UIViewController,UINavigationControllerDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func buttonClicked(_ sender: Any) {
        self.navigationController?.delegate = self
        self.navigationController?.popViewController(animated: true);
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        
        self.navigationController?.delegate = self
    }
    func navigationController(_ navigationController: UINavigationController, animationControllerFor operation: UINavigationControllerOperation, from fromVC: UIViewController, to toVC: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        if operation == UINavigationControllerOperation.pop {
            return AnimatorPop()
        }
        return nil
    }
    
  


}
