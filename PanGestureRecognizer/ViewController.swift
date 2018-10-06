//
//  ViewController.swift
//  GestureRecognizer-Trash
//
//  Created by Eric Ho on 6/10/18.
//  Copyright © 2018 LomoStudio. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var fileImageView: UIImageView!
    @IBOutlet weak var trashView: UIImageView!
    
    // orginal point
    var fileViewOrign: CGPoint?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // add getsture recognizer for fileView
        addPanGesture(view: fileImageView)
        
    }
    
    override func viewWillLayoutSubviews() {
        // get fileViewOrginalPoint
        fileViewOrign = fileImageView.frame.origin
        
        // bring trashView to the toppest layer
        view.bringSubviewToFront(trashView)
    }

    // setup gesture recognizer for a UIView.
    func addPanGesture(view: UIView) {
        // make sure set this property to true
        view.isUserInteractionEnabled = true
        let pan = UIPanGestureRecognizer(target: self, action: #selector(handlePan(sender: )))
        view.addGestureRecognizer(pan)
        
    }

    @objc func handlePan(sender: UIPanGestureRecognizer) {
        let fileView = sender.view!
        let translation = sender.translation(in: fileView)
        
        switch sender.state {
        case .began, .changed:
            fileView.center = CGPoint(x: fileView.center.x + translation.x, y: fileView.center.y + translation.y)
            sender.setTranslation(CGPoint.zero, in: view)
            
        case .ended:
            if fileView.frame.intersects(trashView.frame) { // when fileImage intersects trashView
                UIView.animate(withDuration: 0.3) {
                    self.fileImageView.alpha = 0.0
                }
            } else {    // release pan gesture before intersects trashview
                fileView.frame.origin = fileViewOrign!
            }
            
        default:
            break
        }
    }
}

