//
//  ConversionTableViewController.swift
//  CWK
//
//  Created by Kumal Perera on 3/11/18.
//  Copyright © 2018 heisenberg. All rights reserved.


import UIKit

class ConversionTableViewController: UITableViewController {
    var myIndex = 0
    var itemList = [["name":"Volume Liquids","image": "1","item":"gallons, litre, pint, fluid ounce"],
                    ["name":"Weight","image": "2","item":"kg, grams, ounces, pounds, stone-pounds"],
                    ["name":"Speed","image": "5","item":"metres/sec, km/hour, miles/hour"],
                    ["name":"Distance","image": "4","item":"cm, metre, inch, mm, yard"],
                    ["name":"Volume","image": "3","item":"m3, cm3, litre"],
                    ["name":"Temperature","image": "6","item":"Celsius, Fahrenheit, Kelvin"]
        ]

    override func viewDidLoad() {
        
        super.viewDidLoad()

        let iconImageView = UIImageView(image: UIImage(named: "q"))
        self.navigationItem.titleView = iconImageView
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return itemList.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! SubTableViewCell
        
        let listObject = itemList[indexPath.row]
        print("row: \(indexPath.row)")

        //cell.backgroundView = UIImageView.init(image: UIImage.init(named: listObject["image"]!))
        cell.backgroundPic.image = UIImage(named: listObject["image"]!)
        cell.nameLabel.text = listObject["name"]
        cell.itemLabel.text = listObject["item"]
        // Configure the cell...
        return cell
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        myIndex = indexPath.row
        
        
        if(indexPath.row == 0){
            performSegue(withIdentifier: "VolumeSegue", sender: self)
        }
        else if(indexPath.row == 1){
            performSegue(withIdentifier: "WeightSegue", sender: self)
        }
        else if(indexPath.row == 2){
            performSegue(withIdentifier: "SpeedSegue", sender: self)
        }
        else if(indexPath.row == 3){
            performSegue(withIdentifier: "DistanceSegue", sender: self)
        }
        else if(indexPath.row == 4){
            performSegue(withIdentifier: "RealVolumeSegue", sender: self)
        }
        else if(indexPath.row == 5){
            performSegue(withIdentifier: "TemperatureSegue", sender: self)
        }
        
        
    }
    
   
    @IBAction func addButtonSelect(_ sender: UIBarButtonItem) {
        let alertController = UIAlertController()
        alertController.addAction(UIAlertAction(title: "History", style: .default, handler: self.historyHandler))
        alertController.addAction(UIAlertAction(title: "Constants", style: .default, handler: self.constantHandler))
         alertController.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        self.present(alertController, animated: true, completion: nil)
    }
    
    func historyHandler(alert: UIAlertAction!){
//        let historyViewController = HistoryConversionTableViewController()
//        self.navigationController?.pushViewController(historyViewController, animated: true)
        
        performSegue(withIdentifier: "TestHistory", sender: self)
    }
    
    func constantHandler(alert: UIAlertAction!){
        //self.navigationController?.pushViewController(WeightViewController(), animated: true)
        performSegue(withIdentifier: "ConstantSegue", sender: self)
        
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
