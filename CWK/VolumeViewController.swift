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
        
//        let defaults = UserDefaults.standard
//        let myarray = defaults.stringArray(forKey: "SavedConversionValues") ?? [String]()
//        for element in myarray {
//            print(element)
//        }
//        let value = UserDefaults.standard.object(forKey: "SavedConversionValues")
        
       
    
        
    }
    
    @IBAction func gallonChanged(_ sender: NiceTextField) {
        let gallonValue = Float(gallonLabel.text!)
        
        validationText(text: gallonLabel.text!)
        
        if(gallonValue != nil){
            litreLabel.text = String((Float(gallonValue!) * 3.78541).rounded(toPlaces: 4))
            pintLabel.text = String((Float(gallonValue!) * 8).rounded(toPlaces: 4))
            fluidLabel.text = String((Float(gallonValue!) * 128).rounded(toPlaces: 4))
            
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
            
            litreLabel.text = String((Float(pintValue!) * 0.473176).rounded(toPlaces: 4))
            gallonLabel.text = String((Float(pintValue!) * 0.125).rounded(toPlaces: 4))
            fluidLabel.text = String((Float(pintValue!) * 16).rounded(toPlaces: 4))
            
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
            gallonLabel.text = String((Float(litreValue!) * 0.264172).rounded(toPlaces: 4))
            pintLabel.text = String((Float(litreValue!) * 2.11338).rounded(toPlaces: 4))
            fluidLabel.text = String((Float(litreValue!) * 33.814).rounded(toPlaces: 4))
            
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
            
            litreLabel.text = String((Float(fluidValue!) * 0.0295735).rounded(toPlaces: 4))
            pintLabel.text = String((Float(fluidValue!) * 0.0625).rounded(toPlaces: 4))
            gallonLabel.text = String((Float(fluidValue!) * 0.0078125).rounded(toPlaces: 4))
            
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
    
    
    
    
    
    func validationText(text: String){
        if(text.isEmpty == true){
            print("Enter value")
        }
        
    }
    
    @IBAction func saveButtonPressed(_ sender: Any) {
        
        let refreshAlert = UIAlertController(title: "Save", message: "Do you want to save the values?", preferredStyle: UIAlertControllerStyle.alert)
        
        refreshAlert.addAction(UIAlertAction(title: "Yes", style: .default, handler: { (action: UIAlertAction!) in
            
            let gallon = (self.gallonLabel.text)
            let fluid = (self.fluidLabel.text)
            let pint = (self.pintLabel.text)
            let litre = (self.litreLabel.text)
            
            let volume = "\(gallon ?? "unknown") gallon = \(fluid ?? "unknown") fluid = \(pint ?? "unknown") pint = \(litre ?? "unknown") litre"
            
            var savedArray:Array<String>=[]
            
            let defaults = UserDefaults.standard
            
            if let userData = defaults.object(forKey: "values") as? [String]{
                savedArray=userData
            }
            
            if savedArray.count >= 5{
                savedArray.remove(at: 0)
            }
            
            savedArray.append(volume)
            defaults.set(savedArray, forKey: "values")
            defaults.synchronize()
            
            self.gallonLabel.text = "0"
            self.fluidLabel.text = "0"
            self.pintLabel.text = "0"
            self.litreLabel.text = "0"
            self.saveButton.isEnabled = false
            
        }))
        
        refreshAlert.addAction(UIAlertAction(title: "No", style: .cancel, handler: { (action: UIAlertAction!) in
            print("Handle Cancel Logic here")
        }))
        
        present(refreshAlert, animated: true, completion: nil)
        
        
        
    }
    
    
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let allowedCharacters = CharacterSet.decimalDigits
        let characterSet = CharacterSet(charactersIn: string)
        return allowedCharacters.isSuperset(of: characterSet)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
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
extension Float {
    /// Rounds the double to decimal places value
    func rounded(toPlaces places:Int) -> Float {
        let divisor = pow(10.0, Float(places))
        return (self * divisor).rounded() / divisor
    }
}
