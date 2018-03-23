//
//  SpeedViewController.swift
//  CWK
//
//  Created by Kumal Perera on 3/13/18.
//  Copyright © 2018 heisenberg. All rights reserved.
//

import UIKit

class SpeedViewController: UIViewController, UITextFieldDelegate {
    @IBOutlet weak var metersSecText: NiceTextField!
    @IBOutlet weak var kmHourText: NiceTextField!
    @IBOutlet weak var milesHourText: NiceTextField!
    @IBOutlet weak var saveButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        //setting only decimals valid
        self.metersSecText.delegate = self
        self.kmHourText.delegate = self
        self.milesHourText.delegate = self
        
        
        //disabling button in start
        saveButton.isEnabled = true
        
        //setting decimal keyboard
        self.metersSecText.keyboardType = UIKeyboardType.decimalPad
        self.kmHourText.keyboardType = UIKeyboardType.decimalPad
        self.milesHourText.keyboardType = UIKeyboardType.decimalPad
        
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func metersSecChanged(_ sender: Any) {
        let meterSecValue = Float(metersSecText.text!)
        
        if(meterSecValue != nil) {
            milesHourText.text = String((Float(meterSecValue!) * 2.23694).rounded(toPlaces: 4))
            kmHourText.text = String((Float(meterSecValue!) * 3.6).rounded(toPlaces: 4))
            
            
            saveButton.isEnabled = true
        }
        else {
            milesHourText.text = "0"
            kmHourText.text = "0"

            saveButton.isEnabled = false
        }

    }
    
    @IBAction func kmHourChanged(_ sender: Any) {
        let kmHourValue = Float(metersSecText.text!)
        
        if(kmHourValue != nil) {
            milesHourText.text = String((Float(kmHourValue!) * 0.621371).rounded(toPlaces: 4))
            metersSecText.text = String((Float(kmHourValue!) * 0.277778).rounded(toPlaces: 4))
            
            
            saveButton.isEnabled = true
        }
        else {
            milesHourText.text = "0"
            metersSecText.text = "0"
            
            saveButton.isEnabled = false
        }
    }
    
    @IBAction func milesHourChanged(_ sender: Any) {
        let milesHourValue = Float(metersSecText.text!)
        
        if(milesHourValue != nil) {
            kmHourText.text = String((Float(milesHourValue!) * 1.60934).rounded(toPlaces: 4))
            metersSecText.text = String((Float(milesHourValue!) * 0.44704).rounded(toPlaces: 4))
            
            
            saveButton.isEnabled = true
        }
        else {
            kmHourText.text = "0"
            metersSecText.text = "0"
            
            saveButton.isEnabled = false
        }
    }
    
    @IBAction func saveButtonPressed(_ sender: Any) {
        
        let refreshAlert = UIAlertController(title: "Save", message: "Do you want to save the values?", preferredStyle: UIAlertControllerStyle.alert)
        
        refreshAlert.addAction(UIAlertAction(title: "Yes", style: .default, handler: { (action: UIAlertAction!) in
            
            let kmHour = (self.kmHourText.text)
            let meterSec = (self.metersSecText.text)
            let milesHour = (self.milesHourText.text)
            
            let speed = "\(kmHour ?? "unknown") km/hour = \(meterSec ?? "unknown") meter/sec = \(milesHour ?? "unknown") miles/hour"
            
            var savedArray:Array<String>=[]
            
            let defaults = UserDefaults.standard
            
            if let userData = defaults.object(forKey: "speedValues") as? [String]{
                savedArray=userData
            }
            
            if savedArray.count >= 5{
                savedArray.remove(at: 0)
            }
            
            savedArray.append(speed)
            defaults.set(savedArray, forKey: "speedValues")
            defaults.synchronize()
            print(savedArray)
            
            self.metersSecText.text = "0"
            self.kmHourText.text = "0"
            self.milesHourText.text = "0"
            self.saveButton.isEnabled = false
            
        }))
        
        refreshAlert.addAction(UIAlertAction(title: "No", style: .cancel, handler: { (action: UIAlertAction!) in
            print("Handle Cancel Logic here")
        }))
        
        present(refreshAlert, animated: true, completion: nil)
        
        
        
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


