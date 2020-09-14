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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
    }
    
    @IBAction func startedChanging(_ sender: Any) {
        print("STARTED PRINTING")
    }
    
    @IBAction func handlePrice(_ sender: Any) {
        print("PRICE", originalPrice.text! )
        print("DISCOUNT", discount.text! )
        print("TAX", tax.text! )
        var oPrice =
    }
    
}

