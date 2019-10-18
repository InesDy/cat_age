//
//  ViewController.swift
//  Age de chat
//
//  Created by Bitch Face on 07.10.19.
//  Copyright © 2019 Inès. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var ageTextField: UITextField!
    @IBOutlet weak var resultLabel: UITextView!
    @IBOutlet var SwipeRight: UISwipeGestureRecognizer!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        // keyboard away when tapping outside the box
        view.addGestureRecognizer(UITapGestureRecognizer(target: view, action: #selector(UIView.endEditing(_:))))

    }
    
    
   
    override var preferredStatusBarStyle: UIStatusBarStyle { return .lightContent }
    
    @IBAction func calculerAction(_ sender: Any) {
        
        // Put away the keyboard
        view.endEditing (true)
        
        
        // check if the textfield is nil
        
        if ageTextField != nil {
            let text = ageTextField.text!
            
            
            if let nombreEntier = Double(text), nombreEntier < 100 {
                let ageOfCat = nombreEntier / 7
                let formatedAge = String(format: "%.2f", ageOfCat)
            
            
                
                
   resultLabel.text = "Votre âge de chat est de : \(formatedAge) ans"
                
switch nombreEntier {
    case 10 : resultLabel.text = "you will be dead as a cat" + " but you age would be                              \(formatedAge)"
    case 25 : resultLabel.text = "you will be dead for a long time"
    case 29 : resultLabel.text = "you almost dead as a human" +  " but you age would be : \(formatedAge)"
    default:
            break
                    
                }
            } else {
                resultLabel.text = "Invalid number"
                
                DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                    self.resultLabel.text = "You dummy"
                }
            }
        }
    }
    
}









