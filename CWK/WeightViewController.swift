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
        
        let refreshAlert = UIAlertController(title: "Save", message: "Do you want to save the conversion?", preferredStyle: UIAlertControllerStyle.alert)
        
        refreshAlert.addAction(UIAlertAction(title: "Yes", style: .default, handler: { (action: UIAlertAction!) in
           
            let kg = (self.kgText.text)
            let grams = (self.gramText.text)
            let ounce = (self.ounceText.text)
            let pound = (self.poundText.text)
            let stone = (self.stoneText.text)
            
            let weight = "\(kg ?? "unknown") kg = \(grams ?? "unknown") grams = \(ounce ?? "unknown") ounces = \(pound ?? "unknown") pounds = \(stone ?? "unknown") stones"
            
            var savedArray:Array<String>=[]
            
            let defaults = UserDefaults.standard
            
            if let userData = defaults.object(forKey: "weightValues") as? [String]{
                savedArray=userData
            }
            
            if savedArray.count >= 5{
                savedArray.remove(at: 0)
            }
            
            savedArray.append(weight)
            defaults.set(savedArray, forKey: "weightValues")
            defaults.synchronize()
            print(savedArray)
            
            //set values to 0
            self.kgText.text = "0"
            self.stoneText.text = "0"
            self.stonePText.text = "0"
            self.poundText.text = "0"
            self.ounceText.text = "0"
            self.gramText.text = "0"
            self.saveButton.isEnabled = false
            
        }))
        
        refreshAlert.addAction(UIAlertAction(title: "No", style: .cancel, handler: { (action: UIAlertAction!) in
            
            
        }))
        
        present(refreshAlert, animated: true, completion: nil)
        
        
        
        
    }
    func updateAll(poundValue:Float,unit:String){
        if(unit != "kg"){
            kgText.text = String((Float(poundValue) * 0.453592).rounded(toPlaces: 4))
        }
        if(unit != "g"){
            gramText.text = String((Float(poundValue) * 453.592).rounded(toPlaces: 4))
        }
        if(unit != "oz"){
            ounceText.text = String((Float(poundValue) * 16).rounded(toPlaces: 4))
        }
        
        if(unit != "lb"){
            poundText.text = String(poundValue)
        }
        if(unit != "st" || unit != "st"){
            let fullNum    = String(poundValue)
            let fullNumArr = fullNum.components(separatedBy: ".")
            let intPart:Int    = Int(fullNumArr[0])!
            let decPart:String = (fullNumArr[1])
            var (stValue, stPValue) = intPart.quotientAndRemainder(dividingBy: 14)
            stoneText.text=String(stValue)
            stonePText.text = String("\(stPValue).\(decPart)")
            
           //            let decimalPart = stringPV.split(separator: ".")[1]
//            let decimalPArtDecimal =
//
        }
        saveButton.isEnabled = true
    }
    
    
    func resetAll(){
        kgText.text = ""
        gramText.text = ""
        stoneText.text = ""
        stonePText.text = ""
        poundText.text = ""
        ounceText.text = ""
        saveButton.isEnabled = false
    }
    @IBAction func kgChanged(_ sender: Any) {
        let unit = "kg"
        let kgValue = Float(kgText.text!)
        if(kgValue != nil) {
            let lbValue = (Float(kgValue!) * 2.204622).rounded(toPlaces: 4)
            updateAll(poundValue: lbValue,unit: unit)
        }
        else {
            resetAll()
        }
    }
    
    @IBAction func gramChanged(_ sender: Any) {
        let unit = "g"
        let gValue = Float(gramText.text!)
        if(gValue != nil) {
            let lbValue = (Float(gValue!) * 0.0022046).rounded(toPlaces: 4)
            updateAll(poundValue: lbValue,unit: unit)
        }
        else {
            resetAll()
        }
    }
    
    @IBAction func ounceChanged(_ sender: Any) {
        let unit = "oz"
        let ozValue = Float(ounceText.text!)
        if(ozValue != nil) {
            let lbValue = (Float(ozValue!) * 0.0625).rounded(toPlaces: 4)
            updateAll(poundValue: lbValue,unit: unit)
        }
        else {
            resetAll()
        }
    }
    
    @IBAction func poundChanged(_ sender: Any) {
        let unit = "lb"
        let lbValue = Float(poundText.text!)
        if(lbValue != nil) {
            updateAll(poundValue: lbValue!,unit: unit)
        }
        else {
            resetAll()
        }
    }
    
    @IBAction func stoneChanged(_ sender: Any) {
        let unit = "st"
        let stoneValue = Float(stoneText.text!)
        let stonePoundValue = Float(stonePText.text!) != nil ? Float(stonePText.text!) : 0.0
        if(stoneValue == nil) {
            resetAll();
            return;
        }

        let lbValue = Float((stoneValue! * 14) + stonePoundValue!).rounded(toPlaces: 4)
        updateAll(poundValue: lbValue,unit: unit)
    }
    
    @IBAction func stonePoundChanged(_ sender: Any) {
        let unit = "stp"
        let stoneValue = Float(stoneText.text!) != nil ? Float(stoneText.text!) : 0.0
        let stonePoundValue = Float(stonePText.text!)
        if( stonePoundValue == nil) {
            resetAll();
            return;
        }
        let lbValue = Float((stoneValue! * 14) + stonePoundValue!).rounded(toPlaces: 4)
        updateAll(poundValue: lbValue,unit: unit)
    }
//    @IBAction func kgChanged(_ sender: Any) {
//        let kgValue = Float(kgText.text!)
//
//        if(kgValue != nil) {
//            gramText.text = String((Float(kgValue!) * 1000).rounded(toPlaces: 4))
//            stoneText.text = String((Float(kgValue!) * 0.157473).rounded(toPlaces: 4))
//            stonePText.text = String((Float(kgValue!) * 12).rounded(toPlaces: 4))
//            poundText.text = String((Float(kgValue!) * 2.204622).rounded(toPlaces: 4))
//            ounceText.text = String((Float(kgValue!) * 2.204622).rounded(toPlaces: 4))
//
//            saveButton.isEnabled = true
//        }
//        else {
//            gramText.text = "0"
//            stoneText.text = "0"
//            stonePText.text = "0"
//            poundText.text = "0"
//            ounceText.text = "0"
//            saveButton.isEnabled = false
//        }
//
//    }
//
//    @IBAction func gramChanged(_ sender: Any) {
//
//        let gramValue = Float(gramText.text!)
//
//        if(gramValue != nil){
//            kgText.text = String((Float(gramValue!) * 0.001).rounded(toPlaces: 4))
//            stoneText.text = String((Float(gramValue!) * 0.000157).rounded(toPlaces: 4))
//            stonePText.text = String((Float(gramValue!) * 0.000157473).rounded(toPlaces: 4))
//            poundText.text = String((Float(gramValue!) * 0.0022046).rounded(toPlaces: 4))
//            ounceText.text = String((Float(gramValue!) * 2.204622).rounded(toPlaces: 4))
//
//            saveButton.isEnabled = true
//        }
//        else{
//            kgText.text = "0"
//            stoneText.text = "0"
//            stonePText.text = "0"
//            poundText.text = "0"
//            ounceText.text = "0"
//            saveButton.isEnabled = false
//        }
//
//
//    }
//
//    @IBAction func ounceChanged(_ sender: Any) {
//
//        let ounceValue = Float(ounceText.text!)
//
//        if(ounceValue != nil){
//            kgText.text = String((Float(ounceValue!) * 0.0283495).rounded(toPlaces: 4))
//            stoneText.text = String((Float(ounceValue!) * 0.00446429).rounded(toPlaces: 4))
//            stonePText.text = String((Float(ounceValue!) * 0.0625).rounded(toPlaces: 4))
//            poundText.text = String((Float(ounceValue!) * 0.0625).rounded(toPlaces: 4))
//            gramText.text = String((Float(ounceValue!) * 28.3495).rounded(toPlaces: 4))
//
//            saveButton.isEnabled = true
//        }
//        else{
//            kgText.text = "0"
//            stoneText.text = "0"
//            stonePText.text = "0"
//            poundText.text = "0"
//            gramText.text = "0"
//            saveButton.isEnabled = false
//        }
//
//    }
//
//    @IBAction func poundChanged(_ sender: Any) {
//
//        let poundValue = Float(poundText.text!)
//
//        if(poundValue != nil){
//            kgText.text = String((Float(poundValue!) * 0.4535).rounded(toPlaces: 4))
//            stoneText.text = String((Float(poundValue!) * 0.0714).rounded(toPlaces: 4))
//            stonePText.text = String((Float(poundValue!) * 128).rounded(toPlaces: 4))
//            gramText.text = String((Float(poundValue!) * 453.592).rounded(toPlaces: 4))
//
//
//            saveButton.isEnabled = true
//        }
//        else{
//            kgText.text = "0"
//            stoneText.text = "0"
//            stonePText.text = "0"
//            gramText.text = "0"
//            saveButton.isEnabled = false
//        }
//
//
//    }
//
//    @IBAction func stoneChanged(_ sender: Any) {
//
//        let stoneValue = Float(stoneText.text!)
//
//        if(stoneValue != nil){
//            kgText.text = String((Float(stoneValue!) * 3.78541).rounded(toPlaces: 4))
//            gramText.text = String((Float(stoneValue!) * 8).rounded(toPlaces: 4))
//            stonePText.text = String((Float(stoneValue!) * 128).rounded(toPlaces: 4))
//            poundText.text = String((Float(stoneValue!) * 128).rounded(toPlaces: 4))
//
//
//            saveButton.isEnabled = true
//        }
//        else{
//            kgText.text = "0"
//            poundText.text = "0"
//            stonePText.text = "0"
//            gramText.text = "0"
//            saveButton.isEnabled = false
//        }
//
//
//    }
//
//    @IBAction func stonePoundChanged(_ sender: Any) {
//
//        let stonePoundValue = Float(stonePText.text!)
//
//        if(stonePoundValue != nil){
//            kgText.text = String((Float(stonePoundValue!) * 3.78541).rounded(toPlaces: 4))
//            stoneText.text = String((Float(stonePoundValue!) * 8).rounded(toPlaces: 4))
//            gramText.text = String((Float(stonePoundValue!) * 128).rounded(toPlaces: 4))
//            poundText.text = String((Float(stonePoundValue!) * 128).rounded(toPlaces: 4))
//
//
//            saveButton.isEnabled = true
//        }
//        else {
//            kgText.text = "0"
//            poundText.text = "0"
//            stoneText.text = "0"
//            gramText.text = "0"
//            saveButton.isEnabled = false
//
//        }
//
//    }
    
//    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
//        let allowedCharacters = CharacterSet.decimalDigits
//        let characterSet = CharacterSet(charactersIn: string)
//        return allowedCharacters.isSuperset(of: characterSet)
//    }
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

