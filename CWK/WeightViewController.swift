//
//  WeightViewController.swift
//  CWK
//
//  Created by Kumal Perera on 3/12/18.
//  Copyright © 2018 heisenberg. All rights reserved.
//

import UIKit

class WeightViewController: UIViewController, UITextFieldDelegate {
//    @IBOutlet weak var kgText: UITextField!
//    @IBOutlet weak var gramText: UITextField!
//    @IBOutlet weak var poundText: UITextField!
//    @IBOutlet weak var stoneText: UITextField!
//
//    @IBOutlet weak var stonePText: UITextField!
    
//    @IBOutlet weak var kgText: NiceTextField!
//    @IBOutlet weak var gramText: NiceTextField!
//    @IBOutlet weak var ounceText: NiceTextField!
//    @IBOutlet weak var poundText: NiceTextField!
//    @IBOutlet weak var stoneText: NiceTextField!
//    @IBOutlet weak var stonePText: NiceTextField!
    
    @IBOutlet weak var kgText: NiceTextField!
    @IBOutlet weak var gramText: NiceTextField!
    @IBOutlet weak var ounceText: NiceTextField!
    @IBOutlet weak var poundText: NiceTextField!
    @IBOutlet weak var stoneText: NiceTextField!
    @IBOutlet weak var stonePText: NiceTextField!
    
    @IBOutlet weak var saveButton: UIButton!
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //setting only decimals valid
        self.kgText.delegate = self
        self.gramText.delegate = self
        self.poundText.delegate = self
        self.stoneText.delegate = self
        self.stonePText.delegate = self
        
        //disabling button in start
        saveButton.isEnabled = false
        
        //setting decimal keyboard
        self.kgText.keyboardType = UIKeyboardType.decimalPad
        self.gramText.keyboardType = UIKeyboardType.decimalPad
        self.poundText.keyboardType = UIKeyboardType.decimalPad
        self.stoneText.keyboardType = UIKeyboardType.decimalPad
        self.stonePText.keyboardType = UIKeyboardType.decimalPad


        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func saveButtonSelect(_ sender: UIButton) {
    }
    
    @IBAction func kgChanged(_ sender: Any) {
        let kgValue = Float(kgText.text!)
        
        if(kgValue != nil) {
            gramText.text = String(Float(kgValue!) * 1000)
            stoneText.text = String(Float(kgValue!) * 0.157473)
            stonePText.text = String(Float(kgValue!) * 12)
            poundText.text = String(Float(kgValue!) * 2.204622)
            ounceText.text = String(Float(kgValue!) * 2.204622)
            
            saveButton.isEnabled = true
        }
        else {
            gramText.text = "0"
            stoneText.text = "0"
            stonePText.text = "0"
            poundText.text = "0"
            ounceText.text = "0"
            saveButton.isEnabled = false
        }

    }
    
    @IBAction func gramChanged(_ sender: Any) {
        
        let gramValue = Float(gramText.text!)
        
        if(gramValue != nil){
            kgText.text = String(Float(gramValue!) * 0.001)
            stoneText.text = String(Float(gramValue!) * 0.000157)
            stonePText.text = String(Float(gramValue!) * 0.000157473)
            poundText.text = String(Float(gramValue!) * 0.0022046)
            ounceText.text = String(Float(gramValue!) * 2.204622)
            
            saveButton.isEnabled = true
        }
        else{
            kgText.text = "0"
            stoneText.text = "0"
            stonePText.text = "0"
            poundText.text = "0"
            ounceText.text = "0"
            saveButton.isEnabled = false
        }

        
    }
    
    @IBAction func ounceChanged(_ sender: Any) {
    }
    
    @IBAction func poundChanged(_ sender: Any) {
    }
    
    @IBAction func stoneChanged(_ sender: Any) {
    }
    
    @IBAction func stonePoundChanged(_ sender: Any) {
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let allowedCharacters = CharacterSet.decimalDigits
        let characterSet = CharacterSet(charactersIn: string)
        return allowedCharacters.isSuperset(of: characterSet)
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
