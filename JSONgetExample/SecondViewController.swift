//
//  SecondViewController.swift
//  JSONgetExample
//
//  Created by Kanwar Sudeep Singh Sandhu on 18/05/18.
//  Copyright © 2018 Kanwar Sudeep Singh Sandhu. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {



    @IBOutlet weak var lbldemonym: UILabel!
    @IBOutlet weak var lblAlpha2Code: UILabel!
    @IBOutlet weak var lblAlpha3Code: UILabel!
    
    
    

    var demonymStr = ""
    var alpha2CodeStr = ""
    var alpha3CodeStr = ""
    
    override func viewDidLoad() {
        

        lbldemonym.text = ("Demonym : \(demonymStr)")
        lblAlpha2Code.text = ("Aplha 2 Code : \(alpha2CodeStr)")
        lblAlpha3Code.text = ("Aplha 3 Code : \(alpha3CodeStr)")
        
        
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
