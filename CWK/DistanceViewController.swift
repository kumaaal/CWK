//
//  DistanceViewController.swift
//  CWK
//
//  Created by Kumal Perera on 3/13/18.
//  Copyright © 2018 heisenberg. All rights reserved.
//

import UIKit

class DistanceViewController: UIViewController, UITextFieldDelegate {
    @IBOutlet weak var cmText: NiceTextField!
    @IBOutlet weak var meterText: NiceTextField!
    @IBOutlet weak var inchText: NiceTextField!
    @IBOutlet weak var mmText: NiceTextField!
    @IBOutlet weak var yardText: NiceTextField!
    @IBOutlet weak var saveButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        //setting only decimals valid
        self.cmText.delegate = self
        self.meterText.delegate = self
        self.inchText.delegate = self
        self.mmText.delegate = self
        self.yardText.delegate = self
        
        
        //disabling button in start
        saveButton.isEnabled = true
        
        //setting decimal keyboard
        self.cmText.keyboardType = UIKeyboardType.decimalPad
        self.mmText.keyboardType = UIKeyboardType.decimalPad
        self.meterText.keyboardType = UIKeyboardType.decimalPad
        self.inchText.keyboardType = UIKeyboardType.decimalPad
        self.yardText.keyboardType = UIKeyboardType.decimalPad
        

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func saveButtonPressed(_ sender: Any) {
        
        let refreshAlert = UIAlertController(title: "Save", message: "Do you want to save the values?", preferredStyle: UIAlertControllerStyle.alert)
        
        refreshAlert.addAction(UIAlertAction(title: "Yes", style: .default, handler: { (action: UIAlertAction!) in
            
            let cm = (self.cmText.text)
            let mm = (self.mmText.text)
            let meter = (self.meterText.text)
            let inch = (self.inchText.text)
            let yard = (self.yardText.text)
            
            let distance = "\(cm ?? "unknown") cm = \(mm ?? "unknown") mm = \(meter ?? "unknown") meter \(inch ?? "unknown") inch = \(yard ?? "unknown") yard"
            
            var savedArray:Array<String>=[]
            
            let defaults = UserDefaults.standard
            
            if let userData = defaults.object(forKey: "distanceValues") as? [String]{
                savedArray=userData
            }
            
            if savedArray.count >= 5{
                savedArray.remove(at: 0)
            }
            
            savedArray.append(distance)
            defaults.set(savedArray, forKey: "distanceValues")
            defaults.synchronize()
            print(savedArray)
            
            self.cmText.text = "0"
            self.mmText.text = "0"
            self.meterText.text = "0"
            self.inchText.text = "0"
            self.yardText.text = "0"
            self.saveButton.isEnabled = false
            
        }))
        
        refreshAlert.addAction(UIAlertAction(title: "No", style: .cancel, handler: { (action: UIAlertAction!) in
            print("Handle Cancel Logic here")
        }))
        
        present(refreshAlert, animated: true, completion: nil)
        
        
    }
    
    @IBAction func cmChanged(_ sender: Any) {
        
        let cmValue = Float(cmText.text!)
        
        if(cmValue != nil) {
            meterText.text = String((Float(cmValue!) * 0.01).rounded(toPlaces: 4))
            inchText.text = String((Float(cmValue!) * 0.393701).rounded(toPlaces: 4))
            mmText.text = String((Float(cmValue!) * 10).rounded(toPlaces: 4))
            yardText.text = String((Float(cmValue!) * 0.0109361).rounded(toPlaces: 4))
            
            saveButton.isEnabled = true
        }
        else {
            meterText.text = "0"
            inchText.text = "0"
            mmText.text = "0"
            yardText.text = "0"
            saveButton.isEnabled = false
        }

        
    }
    
    @IBAction func meterChanged(_ sender: Any) {
        
        let meterValue = Float(meterText.text!)
        
        if(meterValue != nil) {
            cmText.text = String((Float(meterValue!) * 100).rounded(toPlaces: 4))
            inchText.text = String((Float(meterValue!) * 39.3701).rounded(toPlaces: 4))
            mmText.text = String((Float(meterValue!) * 1000).rounded(toPlaces: 4))
            yardText.text = String((Float(meterValue!) * 1.09361).rounded(toPlaces: 4))
            
            saveButton.isEnabled = true
        }
        else {
            cmText.text = "0"
            inchText.text = "0"
            mmText.text = "0"
            yardText.text = "0"
            saveButton.isEnabled = false
        }
        
    }
    
    @IBAction func inchChanged(_ sender: Any) {
        
        let inchValue = Float(inchText.text!)
        
        if(inchValue != nil) {
            cmText.text = String((Float(inchValue!) * 2.54).rounded(toPlaces: 4))
            meterText.text = String((Float(inchValue!) * 0.0254).rounded(toPlaces: 4))
            mmText.text = String((Float(inchValue!) * 25.4).rounded(toPlaces: 4))
            yardText.text = String((Float(inchValue!) * 0.0277778).rounded(toPlaces: 4))
            
            saveButton.isEnabled = true
        }
        else {
            cmText.text = "0"
            meterText.text = "0"
            mmText.text = "0"
            yardText.text = "0"
            saveButton.isEnabled = false
        }
        
    }
    
    @IBAction func mmChanged(_ sender: Any) {
        
        let mmValue = Float(mmText.text!)
        
        if(mmValue != nil) {
            cmText.text = String((Float(mmValue!) * 0.1).rounded(toPlaces: 4))
            meterText.text = String((Float(mmValue!) * 0.001).rounded(toPlaces: 4))
            inchText.text = String((Float(mmValue!) * 0.0393701).rounded(toPlaces: 4))
            yardText.text = String((Float(mmValue!) * 0.00109361).rounded(toPlaces: 4))
            
            saveButton.isEnabled = true
        }
        else {
            cmText.text = "0"
            meterText.text = "0"
            inchText.text = "0"
            yardText.text = "0"
            saveButton.isEnabled = false
        }
        
    }
    
    @IBAction func yardChanged(_ sender: Any) {
        
        let yardValue = Float(yardText.text!)
        
        if(yardValue != nil) {
            cmText.text = String((Float(yardValue!) * 91.44).rounded(toPlaces: 4))
            meterText.text = String((Float(yardValue!) * 0.9144).rounded(toPlaces: 4))
            inchText.text = String((Float(yardValue!) * 36).rounded(toPlaces: 4))
            mmText.text = String((Float(yardValue!) * 914.4).rounded(toPlaces: 4))
            
            saveButton.isEnabled = true
        }
        else {
            cmText.text = "0"
            meterText.text = "0"
            inchText.text = "0"
            mmText.text = "0"
            saveButton.isEnabled = false
        }
        
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        let newString = (textField.text! as NSString).replacingCharacters(in: range, with: string)
        let arrayOfString = newString.components(separatedBy: ".")
        
        if arrayOfString.count > 2 {
            return false
        }
        return true
    }
}


