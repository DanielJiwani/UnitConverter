//
//  CurrencyRatesViewController.swift
//  Converter
//
//  Created by Daniel Jiwani on 6/5/18.
//  Copyright © 2018 Daniel Jiwani. All rights reserved.
//

import UIKit

class CurrencyRatesViewController: UIViewController {

    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        let url = URL(string: "http://data.fixer.io/api/latest?access_key=ad4b33e3db0a3e94c660ba936f76c973&format=1")
        
        let task = URLSession.shared.dataTask(with: url!) { (data,response,error) in
            
            if error != nil
            {
                print("Error")
            }
            else
            {
                if let content = data
                {
                    do
                    {
                        let myJson = try JSONSerialization.jsonObject(with: content, options: JSONSerialization.ReadingOptions.mutableContainers) as AnyObject
                        
                        print(myJson)
                    }
                    catch
                    {
                        
                    }
                }
            }
        }
        task.resume()
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
