//
//  HistoryTestViewController.swift
//  CWK
//
//  Created by Kumal Perera on 3/23/18.
//  Copyright © 2018 heisenberg. All rights reserved.
//

import UIKit

class HistoryTestViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var textView: UITextView!
    
    var volumeArray:Array<String>=[]
    var weightArray:Array<String>=[]
    var speedArray:Array<String>=[]
    var distanceArray:Array<String>=[]
    var temperatureArray:Array<String>=[]
    var liquidsArray:Array<String>=[]
    
    let defaults = UserDefaults.standard

    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let volumeData = defaults.object(forKey: "volumeValues") as? [String]{
            volumeArray=volumeData
        }
        if let weightData = defaults.object(forKey: "weightValues") as? [String]{
            weightArray=weightData
        }
        if let speedData = defaults.object(forKey: "speedValues") as? [String]{
            speedArray=speedData
        }
        if let distanceData = defaults.object(forKey: "distanceValues") as? [String]{
            distanceArray=distanceData
        }
        if let temperatureData = defaults.object(forKey: "temperatureValues") as? [String]{
            temperatureArray=temperatureData
        }
        if let liquidsData = defaults.object(forKey: "liquidsValues") as? [String]{
            liquidsArray=liquidsData
        }

        // Do any additional setup after loading the view.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        
        var returnValue = 0
        
        switch (segmentedControl.selectedSegmentIndex){
        case 0:
            returnValue = volumeArray.count
            break
        case 1:
            returnValue = weightArray.count
            break
        case 2:
            returnValue = speedArray.count
            break
        case 3:
            returnValue = liquidsArray.count
            break
        case 4:
            returnValue = temperatureArray.count
            break
        case 5:
            returnValue = distanceArray.count
            break
        default:
            break
        }
        
        return returnValue
    }
    
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "History", for: indexPath) as! AnotherTableHistoryTableViewCell
        
        switch (segmentedControl.selectedSegmentIndex){
        case 0:
            //returnValue = volumeArray.count
            cell.anotherText.text = volumeArray[indexPath.row]
            break
        case 1:
            cell.anotherText.text = weightArray[indexPath.row]
            //returnValue = weightArray.count
            break
        case 2:
            cell.anotherText.text = speedArray[indexPath.row]
            //returnValue = speedArray.count
            break
        case 3:
            cell.anotherText.text = liquidsArray[indexPath.row]
            //returnValue = liquidsArray.count
            break
        case 4:
            cell.anotherText.text = temperatureArray[indexPath.row]
           // returnValue = temperatureArray.count
            break
        case 5:
            cell.anotherText.text = distanceArray[indexPath.row]
            //returnValue = distanceArray.count
            break
        default:
            break
        }
        
        return cell
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func categoryChanged(_ sender: Any) {
        tableView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
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
