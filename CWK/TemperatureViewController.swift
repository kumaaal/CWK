//
//  TemperatureViewController.swift
//  CWK
//
//  Created by Kumal Perera on 3/13/18.
//  Copyright © 2018 heisenberg. All rights reserved.
//

import UIKit

class TemperatureViewController: UIViewController, UITextFieldDelegate {
    @IBOutlet weak var celciusText: NiceTextField!
    @IBOutlet weak var farenheitText: NiceTextField!
    @IBOutlet weak var kelvinText: NiceTextField!
    
    @IBOutlet weak var saveButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //setting only decimals valid
        self.celciusText.delegate = self
        self.farenheitText.delegate = self
        self.kelvinText.delegate = self
        
        //disabling button in start
        saveButton.isEnabled = true
        
        //setting decimal keyboard
        self.celciusText.keyboardType = UIKeyboardType.decimalPad
        self.farenheitText.keyboardType = UIKeyboardType.decimalPad
        self.kelvinText.keyboardType = UIKeyboardType.decimalPad
       

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func celciusChanged(_ sender: Any) {
        
        let centValue = (self.celciusText.text! as NSString).floatValue
        let farenValue = centToFar(cent: centValue)
        let kelValue = centValue + 273.15
        self.farenheitText.text = "\(farenValue.rounded(toPlaces: 4))"
        self.kelvinText.text = "\(kelValue.rounded(toPlaces: 4))"
        
    }
    
    @IBAction func farenheitChanged(_ sender: Any) {
        
        let farenValue = (self.farenheitText.text! as NSString).floatValue
        let centValue = farToCent(far: farenValue)
        let kelValue = centValue + 273.15
        self.kelvinText.text = "\(kelValue.rounded(toPlaces: 4))"
        self.celciusText.text = "\(centValue.rounded(toPlaces: 4))"
        
    }
    
    @IBAction func kelvinChanged(_ sender: Any) {
        
        //convert to celcius
        let kelValue = (self.kelvinText.text! as NSString).floatValue
        let centValue = kelValue - 273.15
        let farenValue = centToFar(cent: centValue)
        self.celciusText.text = "\(centValue.rounded(toPlaces: 4))"
        self.farenheitText.text = "\(farenValue.rounded(toPlaces: 4))"
        
    }
    
    @IBAction func saveButtonPressed(_ sender: Any) {
        
        let refreshAlert = UIAlertController(title: "Save", message: "Do you want to save the values?", preferredStyle: UIAlertControllerStyle.alert)
        
        refreshAlert.addAction(UIAlertAction(title: "Ok", style: .default, handler: { (action: UIAlertAction!) in
            
            let celcius = (self.celciusText.text)
            let farenheit = (self.farenheitText.text)
            let kelvin = (self.kelvinText.text)
            
            let temperature = "\(celcius ?? "unknown") celcius = \(farenheit ?? "unknown") farenheit = \(kelvin ?? "unknown") kelvin"
            
            var savedArray:Array<String>=[]
            
            let defaults = UserDefaults.standard
            
            if let userData = defaults.object(forKey: "values") as? [String]{
                savedArray=userData
            }
            
            if savedArray.count >= 5{
                savedArray.remove(at: 0)
            }
            
            savedArray.append(temperature)
            defaults.set(savedArray, forKey: "values")
            defaults.synchronize()
            print(savedArray)
            
            self.celciusText.text = "0"
            self.farenheitText.text = "0"
            self.kelvinText.text = "0"
            self.saveButton.isEnabled = false
            
        }))
        
        refreshAlert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: { (action: UIAlertAction!) in
            print("Handle Cancel Logic here")
        }))
        
        present(refreshAlert, animated: true, completion: nil)
        
        
        
        
    }
    
    func centToFar (cent:Float)->Float{
        let far = cent*(9/5) + 32
        return far
    }
    
    func farToCent (far:Float)->Float{
        let cent = (far - 32)*(5/9)
        return cent
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
