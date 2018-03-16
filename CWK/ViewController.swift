//
//  ViewController.swift
//  CWK
//
//  Created by Kumal Perera on 3/7/18.
//  Copyright © 2018 heisenberg. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var plainLabel: UILabel!
    
    @IBAction func buttonPressed(_ sender: UIButton) {
        let title = sender.title(for: .normal)!
        plainLabel.text = "You clicked \(title) button"
    }
    
    
}

