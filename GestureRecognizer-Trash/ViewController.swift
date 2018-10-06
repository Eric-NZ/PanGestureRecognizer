//
//  ViewController.swift
//  GestureRecognizer-Trash
//
//  Created by Eric Ho on 6/10/18.
//  Copyright © 2018 LomoStudio. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var fileView: UIImageView!
    @IBOutlet weak var trashView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // add getsture recognizer for fileView
        addPullGesture(view: fileView)
        
    }

    // setup gesture recognizer for a UIView.
    func addPullGesture(view: UIView) {
        let pull = UIGestureRecognizer(target: self, action: #selector(handlePull))
        view.addGestureRecognizer(pull)
        // make sure set this property to true
        view.isUserInteractionEnabled = true
    }

    @objc func handlePull() {
        
    }
}

