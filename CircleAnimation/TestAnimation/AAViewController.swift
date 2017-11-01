//
//  ViewController.swift
//  TestAnimation
//
//  Created by xjk on 26/10/2017.
//  Copyright © 2017 xjk. All rights reserved.
//

import UIKit

class AAViewController: UIViewController,UINavigationControllerDelegate {

    @IBOutlet weak var clickButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.delegate = self
        
    }
    override func viewWillDisappear(_ animated: Bool) {
        
    }
   
    @IBAction func buttonClicked(_ sender: UIButton) {
       
       
    }
    
    
    func navigationController(_ navigationController: UINavigationController, animationControllerFor operation: UINavigationControllerOperation, from fromVC: UIViewController, to toVC: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        if operation == UINavigationControllerOperation.push {
            return AnimatorPush()
        }
        return nil
    }
   

}

