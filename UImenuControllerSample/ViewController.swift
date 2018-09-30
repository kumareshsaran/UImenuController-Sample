//
//  ViewController.swift
//  UImenuControllerSample
//
//  Created by CSS on 30/09/18.
//  Copyright © 2018 css. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var menulabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        pangesture()
         menulabel.isUserInteractionEnabled = true
        // Do any additional setup after loading the view, typically from a nib.
    }
    
//    override func canBecomeFirstResponder() -> Bool {
//        return true
//    }
    
    override func canPerformAction(_ action: Selector, withSender sender: Any?) -> Bool {
        if action == #selector(ViewController.saveItem(menu:)) || action == #selector(ViewController.deleteItem(menu:)){
            return true
        }
        return false
    }
    
    
    private func pangesture(){
        let longPres = UILongPressGestureRecognizer(target: self, action: #selector(LongPressDetected(sender:)))
        longPres.minimumPressDuration = 0.3
        menulabel.addGestureRecognizer(longPres)
        
    }
    
    @IBAction func LongPressDetected(sender: UILongPressGestureRecognizer){
        guard sender.state == .began,
            let senderView = sender.view,
            let superView = sender.view?.superview
            else { return }
        print("long press detected")
        let menuCOntroller : UIMenuController  = UIMenuController.shared
        
        menuCOntroller.isMenuVisible = true
        menuCOntroller.arrowDirection = .down
        
        senderView.becomeFirstResponder()
        let saveitem = UIMenuItem(title: "Save", action: #selector(saveItem(menu:)))
        let deleteitem = UIMenuItem(title: "Delete", action: #selector(deleteItem(menu:)))
        
        menuCOntroller.menuItems = [saveitem, deleteitem]
        menuCOntroller.setTargetRect(senderView.frame, in: superView)
        menuCOntroller.setMenuVisible(true, animated: true)
    }
    
    @IBAction func saveItem(menu: UIMenuItem){
       print("save tapped")
    }

    @IBAction func deleteItem(menu: UIMenuItem){
        print("delete tapped")
    }
    
    override var canBecomeFirstResponder: Bool {
        return true
    }

}

