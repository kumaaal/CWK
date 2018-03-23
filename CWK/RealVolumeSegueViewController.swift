//
//  RealVolumeSegueViewController.swift
//  CWK
//
//  Created by Kumal Perera on 3/17/18.
//  Copyright © 2018 heisenberg. All rights reserved.
//

import UIKit

class RealVolumeSegueViewController: UIViewController,UITextFieldDelegate {
    @IBOutlet weak var cmText: NiceTextField!
    @IBOutlet weak var mText: NiceTextField!
    @IBOutlet weak var litresText: NiceTextField!
    
    @IBOutlet weak var saveButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()

        //setting only decimals valid
        self.cmText.delegate = self
        self.mText.delegate = self
        self.litresText.delegate = self
        
        //disabling button in start
        saveButton.isEnabled = true
        
        //setting decimal keyboard
        self.cmText.keyboardType = UIKeyboardType.decimalPad
        self.mText.keyboardType = UIKeyboardType.decimalPad
        self.litresText.keyboardType = UIKeyboardType.decimalPad
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func cmChanged(_ sender: Any) {
        
        let cmValue = Float(cmText.text!)
        
        if(cmValue != nil) {
            mText.text = String((Float(cmValue!) * 1000000).rounded(toPlaces: 4))
            litresText.text = String((Float(cmValue!) * 0.001).rounded(toPlaces: 4))
            
            
            
            saveButton.isEnabled = true
        }
        else {
            mText.text = "0"
            litresText.text = "0"
           
            saveButton.isEnabled = false
        }
        
    }
    
    @IBAction func mChanged(_ sender: Any) {
        
        let mValue = Float(mText.text!)
        
        if(mValue != nil) {
            cmText.text = String((Float(mValue!) * 1000000).rounded(toPlaces: 4))
            litresText.text = String((Float(mValue!) * 1000).rounded(toPlaces: 4))
            
            
            
            saveButton.isEnabled = true
        }
        else {
            cmText.text = "0"
            litresText.text = "0"
            
            saveButton.isEnabled = false
        }
        
    }
    
    @IBAction func litresChanged(_ sender: Any) {
        
        let litreValue = Float(litresText.text!)
        
        if(litreValue != nil) {
            mText.text = String((Float(litreValue!) * 1000).rounded(toPlaces: 4))
            cmText.text = String((Float(litreValue!) * 0.001).rounded(toPlaces: 4))
            
            
            
            saveButton.isEnabled = true
        }
        else {
            mText.text = "0"
            cmText.text = "0"
            
            saveButton.isEnabled = false
        }
        
    }
    
    
    @IBAction func saveButtonPressed(_ sender: Any) {
        
        let refreshAlert = UIAlertController(title: "Save", message: "Do you want tot save the values?", preferredStyle: UIAlertControllerStyle.alert)
        
        refreshAlert.addAction(UIAlertAction(title: "Yes", style: .default, handler: { (action: UIAlertAction!) in
            
            let cm3 = (self.cmText.text)
            let m3 = (self.mText.text)
            let litre = (self.litresText.text)
            
            let volume = "\(cm3 ?? "unknown") ㎤ = \(m3 ?? "unknown") ㎥ = \(litre ?? "unknown") litres"
            
            var savedArray:Array<String>=[]
            
            let defaults = UserDefaults.standard
            
            if let userData = defaults.object(forKey: "volumeValues") as? [String]{
                savedArray=userData
            }
            
            if savedArray.count >= 5{
                savedArray.remove(at: 0)
            }
            
            savedArray.append(volume)
            defaults.set(savedArray, forKey: "volumeValues")
            defaults.synchronize()
            print(savedArray)
            
            self.cmText.text = "0"
            self.mText.text = "0"
            self.litresText.text = "0"
            self.saveButton.isEnabled = false
            
        }))
        
        refreshAlert.addAction(UIAlertAction(title: "No", style: .cancel, handler: { (action: UIAlertAction!) in
            print("Handle Cancel Logic here")
        }))
        
        present(refreshAlert, animated: true, completion: nil)
        
        
        
    }
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
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
