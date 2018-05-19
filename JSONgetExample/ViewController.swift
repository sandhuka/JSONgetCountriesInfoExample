//
//  ViewController.swift
//  JSONgetExample
//
//  Created by Kanwar Sudeep Singh Sandhu on 18/05/18.
//  Copyright © 2018 Kanwar Sudeep Singh Sandhu. All rights reserved.
//

import UIKit
struct JSONStruct: Decodable {
    let name : String
    let capital : String
    let alpha3Code : String
    let alpha2Code : String
    let demonym : String
}
class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var tableView: UITableView!
    var array = [JSONStruct]()
    
    override func viewDidLoad() {
        tableView.delegate = self
        tableView.dataSource = self
        super.viewDidLoad()
        getData()
       
    }

 
    func getData() {
        let url = URL(string: "https://restcountries.eu/rest/v2/all")
        URLSession.shared.dataTask(with: url!) { (data, response, error) in
            do{
            if error == nil {
            self.array = try JSONDecoder().decode([JSONStruct].self, from: data!)
                for mainArray in self.array{
                    print(mainArray.name,":", mainArray.capital, ":", mainArray.alpha3Code)
                    DispatchQueue.main.async {
                         self.tableView.reloadData()
                    }
                   
                }
                }
            }
        catch{
            
            print(error)
            }
         
    }.resume()
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.array.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell") as! CustomTableViewCell
        cell.lblCountry.text = ("Country : \(array[indexPath.row].name)")
        cell.lblCapital.text = ("Capital : \(array[indexPath.row].capital)")
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let SVC:SecondViewController = self.storyboard?.instantiateViewController(withIdentifier: "SecondViewController") as! SecondViewController

        SVC.alpha2CodeStr = self.array[indexPath.row].alpha2Code
        SVC.alpha3CodeStr = self.array[indexPath.row].alpha3Code
        SVC.demonymStr = self.array[indexPath.row].demonym
        
        self.navigationController?.pushViewController(SVC, animated: true)
    }
    
    
 
    
    
    
//    override func tableView(tableView: UITableView, willDisplayCell cell: UITableViewCell, forRowAtIndexPath indexPath: NSIndexPath) {
//
//        cell.contentView.backgroundColor = UIColor.clear
//        let whiteRoundedView : UIView = UIView(frame: CGRectMake(0, 10, self.view.frame.size.width, 70))
//        whiteRoundedView.layer.backgroundColor = CGColor(colorSpace: CGColorSpaceCreateDeviceRGB(), components: [1.0, 1.0, 1.0, 1.0])
//        whiteRoundedView.layer.masksToBounds = false
//        whiteRoundedView.layer.cornerRadius = 3.0
//        whiteRoundedView.layer.shadowOffset = CGSizeMake(-1, 1)
//        whiteRoundedView.layer.shadowOpacity = 0.5
//        cell.contentView.addSubview(whiteRoundedView)
//        cell.contentView.sendSubviewToBack(whiteRoundedView)
//    }
    
    
}
