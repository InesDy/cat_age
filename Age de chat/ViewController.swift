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
    @IBOutlet weak var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addGestureRecognizer(UITapGestureRecognizer(target: view, action: #selector(UIView.endEditing(_:))))
        
        let swipeLeftGesture = UISwipeGestureRecognizer(target: self, action: #selector(swipeLeft(sender:)))
        swipeLeftGesture.direction = .left
        view.addGestureRecognizer(swipeLeftGesture)
        
    }
    
    @objc func swipeLeft(sender: UISwipeGestureRecognizer) {
        show(SecondViewController(), sender: self)
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle { return .lightContent }
    
    @IBAction func calculerAction(_ sender: Any) {
        
        // Put away the keyboard
        view.endEditing (true)
        
        
        // check if the textfield is nil
        
        if ageTextField != nil {
            let text = ageTextField.text!
            
            
            if let nombreEntier = Double(text), nombreEntier >= 0, nombreEntier <= 100 {
                let ageOfCat = nombreEntier / 7
                let formatedAge = String(format: "%.2f", ageOfCat)
        
                switch nombreEntier {
                case 0..<20 :
                    resultLabel.text = "you will be dead as a cat" + " but you age would be \(formatedAge)"
                    imageView.image = UIImage(named: "babyCat")
                case 20..<40 :
                    resultLabel.text = "you will be dead for a long time" + " but you age would be : \(formatedAge)"
                    imageView.image = UIImage(named: "normal")
                case 40..<60 :
                    resultLabel.text = "you old af" +  " but you age would be : \(formatedAge)"
                    imageView.image = UIImage(named: "OldCat")
                    view.backgroundColor = .darkGray
                case 60..<80 :
                    resultLabel.text = "you almost dead as a human" +  " but you age would be : \(formatedAge)"
                    imageView.image = UIImage(named: "NakedCat")
                case 80..<100 :
                    resultLabel.text = "you reincarnated poor thing" +  " but you age would be : \(formatedAge)"
                    imageView.image = UIImage(named: "Dog")
                default:
                    resultLabel.text = "Your cat age is : \(formatedAge)"
                    imageView.image = UIImage(named: "StartCat")
                }
            } else {
                resultLabel.text = "Invalid number"
                imageView.image = UIImage(named: "StartCat")
                view.backgroundColor = .black
                
                DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                    self.resultLabel.text = "You dummy"
                }
            }
        }
    }
    
}









