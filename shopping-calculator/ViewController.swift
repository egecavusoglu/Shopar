//
//  ViewController.swift
//  shopping-calculator
//
//  Created by Ege Çavuşoğlu on 8/29/20.
//  Copyright © 2020 Ege Çavuşoğlu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var originalPrice: UITextField!
    @IBOutlet weak var discount: UITextField!
    @IBOutlet weak var tax: UITextField!
    @IBOutlet weak var finalPrice: UILabel!
    @IBOutlet weak var loader: UIActivityIndicatorView!
    @IBOutlet weak var dollarSign: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
       let tapGesture = UITapGestureRecognizer(target: view, action: #selector(UIView.endEditing))
       view.addGestureRecognizer(tapGesture)
        finalPrice.alpha = 0
        loader.alpha = 0
        dollarSign.alpha = 0
        setBorders(myTextField: originalPrice)
        setBorders(myTextField: discount)
        setBorders(myTextField: tax)
        
    }
    
    // Got bottom border styling code from https://stackoverflow.com/a/31108018
    func setBorders (myTextField: UITextField) {
        let bottomLine = CALayer()
        bottomLine.frame = CGRect(x: 0.0, y: myTextField.frame.height - 1, width: myTextField.frame.width, height: 1.0)
        bottomLine.backgroundColor = UIColor.white.cgColor
        myTextField.borderStyle = UITextField.BorderStyle.none
        myTextField.layer.addSublayer(bottomLine)
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    @IBAction func startedChanging(_ sender: Any) {
//        print("STARTED PRINTING")
        handleVisibility(type: "load")

    }
    
    @IBAction func handlePrice(_ sender: Any) {
        
    if let o = Double(originalPrice.text!), let d = Double(discount.text!), let t = Double(tax.text!) {
            print("NUMBERS", o, d, t)
            let fin = calculateFinal(o: o, d: d, t: t);
            print("FIN", fin)
            finalPrice.text = fin
            handleVisibility(type: "")
        }
        else {
            print("WRONG INPUTS")
            finalPrice.text = "N/A"
            handleVisibility(type: "")

        }
        

    }
    
    func calculateFinal (o: Double, d: Double, t: Double) -> String {
        return String(format: "%.2f", o * (1.0 - (d/100)) * (1 + (t / 100)))
    }
    
    func handleVisibility (type: String) {
        print("WORKING")
        if (type == "load"){
            print("LOADING")
            finalPrice.alpha = 0
            dollarSign.alpha = 0
            loader.alpha = 1
            loader.startAnimating()
        }
        else {
            print("SETTING")
            finalPrice.alpha = 1
            dollarSign.alpha = 1
            loader.alpha = 0
            loader.stopAnimating()
        }
    }
    
}

