//
//  CurrencyViewController.swift
//  Converter
//
//  Created by Daniel Jiwani on 6/4/18.
//  Copyright © 2018 Daniel Jiwani. All rights reserved.
//

import UIKit

class CurrencyViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {

    var currency:[String] = []
    var currencyValues:[Double] = []
    var activeCurrency:Double = 0;
    
    //Objects
    @IBOutlet weak var input: UITextField!
    @IBOutlet weak var menuButton: UIBarButtonItem!
    @IBOutlet weak var pickerView: UIPickerView!
    @IBOutlet weak var output: UILabel!
    
    //Creating Picker View
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return currency.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return currency[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        activeCurrency = currencyValues[row]
    }
    
    //Button
    @IBAction func action(_ sender: Any)
    {
        if (input.text != "")
        {
            output.text = String(Double(input.text!)! * activeCurrency)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        sideMenus()
        pickerView.delegate = self
        pickerView.dataSource = self
        
        //Getting Data from fixer.io for live currency rates
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
                        
                        if let rates = myJson["rates"] as? NSDictionary
                        {
                            for(key, value) in rates
                            {
                                self.currency.append((key as? String)!)
                                self.currencyValues.append((value as? Double)!)
                            }
                        }
                    }
                    catch
                    {
                        
                    }
                }
            }
            DispatchQueue.main.async {
                self.pickerView.reloadAllComponents()
            }
        }
        task.resume()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func sideMenus() {
        if revealViewController() != nil{
            menuButton.target = revealViewController()
            menuButton.action = #selector(SWRevealViewController.revealToggle(_:))
            revealViewController().rearViewRevealWidth = 275
            
            view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
            
        }
    }
}
