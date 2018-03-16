//
//  VolumeViewController.swift
//  CWK
//
//  Created by Kumal Perera on 3/13/18.
//  Copyright © 2018 heisenberg. All rights reserved.
//

import UIKit

class VolumeViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var gallonLabel: NiceTextField!
    @IBOutlet weak var fluidLabel: NiceTextField!
    @IBOutlet weak var pintLabel: NiceTextField!
    @IBOutlet weak var litreLabel: NiceTextField!
    
    @IBOutlet weak var saveButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //setting only decimals valid
        self.gallonLabel.delegate = self
        self.litreLabel.delegate = self
        self.pintLabel.delegate = self
        self.fluidLabel.delegate = self
        
        //disabling button in start
        saveButton.isEnabled = true
        
        //setting decimal keyboard
        self.gallonLabel.keyboardType = UIKeyboardType.decimalPad
        self.fluidLabel.keyboardType = UIKeyboardType.decimalPad
        self.pintLabel.keyboardType = UIKeyboardType.decimalPad
        self.litreLabel.keyboardType = UIKeyboardType.decimalPad

        // Do any additional setup after loading the view.
    }
    
    @IBAction func gallonChanged(_ sender: NiceTextField) {
        let gallonValue = Float(gallonLabel.text!)
        
        validationText(text: gallonLabel.text!)
        
        if(gallonValue != nil){
            litreLabel.text = String(Float(gallonValue!) * 3.78541)
            pintLabel.text = String(Float(gallonValue!) * 8)
            fluidLabel.text = String(Float(gallonValue!) * 128)
            
            saveButton.isEnabled = true
        }
        else{
            litreLabel.text = "0"
            pintLabel.text = "0"
            fluidLabel.text = "0"
            saveButton.isEnabled = false
        }
    }
    
    @IBAction func pintChanged(_ sender: NiceTextField) {
        let pintValue = Float(pintLabel.text!)
        
        validationText(text: pintLabel.text!)
        
        if(pintValue != nil){
            
            litreLabel.text = String(Float(pintValue!) * 0.473176)
            gallonLabel.text = String(Float(pintValue!) * 0.125)
            fluidLabel.text = String(Float(pintValue!) * 16)
            
            saveButton.isEnabled = true
        }
        else{
            gallonLabel.text = "0"
            litreLabel.text = "0"
            fluidLabel.text = "0"
            saveButton.isEnabled = false
        }
    }
    
    @IBAction func litreChanged(_ sender: NiceTextField) {
        let litreValue = Float(litreLabel.text!)
        
        validationText(text: litreLabel.text!)
        
        if(litreValue != nil){
            gallonLabel.text = String(Float(litreValue!) * 0.264172)
            pintLabel.text = String(Float(litreValue!) * 2.11338)
            fluidLabel.text = String(Float(litreValue!) * 33.814)
            
            saveButton.isEnabled = true
        }
        else{
            gallonLabel.text = "0"
            pintLabel.text = "0"
            fluidLabel.text = "0"
            saveButton.isEnabled = false
        }
    }
    
    @IBAction func fluidChanged(_ sender: NiceTextField) {
        let fluidValue = Float(fluidLabel.text!)
        
        validationText(text: fluidLabel.text!)
        
        if(fluidValue != nil){
            
            litreLabel.text = String(Float(fluidValue!) * 0.0295735)
            pintLabel.text = String(Float(fluidValue!) * 0.0625)
            gallonLabel.text = String(Float(fluidValue!) * 0.0078125)
            
            saveButton.isEnabled = true
        }
        else{
            gallonLabel.text = "0"
            litreLabel.text = "0"
            pintLabel.text = "0"
            saveButton.isEnabled = false
        }
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func saveButtonPressed(_ sender: UIButton) {
        //litreLabel.text = "God"
    }
    
    
    
    func validationText(text: String){
        if(text.isEmpty == true){
            print("Enter value")
        }
        
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
