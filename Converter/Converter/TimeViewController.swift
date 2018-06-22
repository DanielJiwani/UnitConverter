//
//  TimeViewController.swift
//  Converter
//
//  Created by Daniel Jiwani on 6/8/18.
//  Copyright © 2018 Daniel Jiwani. All rights reserved.
//

import UIKit

class TimeViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    let list = Unit.allCases()
    
    @IBOutlet weak var menuButton: UIBarButtonItem!
    @IBOutlet weak var input: UITextField!
    @IBOutlet weak var output: UITextField!
    @IBOutlet weak var picker: UIPickerView!
    @IBAction func convertUnits(_ sender: Any) {
        
        let fromUnitIdx = picker.selectedRow(inComponent: 0)
        let toUnitIdx = picker.selectedRow(inComponent: 1)
        
        let fromUnit = Unit.fromString(list[fromUnitIdx])!
        let toUnit = Unit.fromString(list[toUnitIdx])!
        
        if let inputText = input.text {
            if !inputText.isEmpty {
                let inputNum = Double(inputText)!
                let outputNum = fromUnit.convertTo(unit: toUnit, value: inputNum)
                output.text = String(outputNum)
            }
        }
    }

    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 2
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return list.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return list[row]
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        sideMenus()
        picker.delegate = self
        picker.dataSource = self
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
    
    enum Unit: Int {
        case Millennium = 0, Century, Decade, Year, Month, Week, Day, Hour, Minute, Second,
            Millisecond, Microsecond, Nanosecond
        
        func description() -> String {
            switch self {
            case .Millennium:
                return "Millennium"
            case .Century:
                return "Century"
            case .Decade:
                return "Decade"
            case .Year:
                return "Year"
            case .Month:
                return "Month"
            case .Week:
                return "Week"
            case .Day:
                return "Day"
            case .Hour:
                return "Hour"
            case .Minute:
                return "Minute"
            case .Second:
                return "Second"
            case .Millisecond:
                return "Millisecond"
            case .Microsecond:
                return "Microsecond"
            case .Nanosecond:
                return "Nanosecond"
            }
        }
        
        func convertTo(unit to: Unit, value val: Double) -> Double {
            var constant = 1.0
            switch self {
            case .Millennium:
                if to == .Millennium {
                    constant = constant + 0
                } else if to == .Century {
                    constant = 10
                } else if to == .Decade {
                    constant = 100
                } else if to == .Year {
                    constant = 1000
                } else if to == .Month {
                    constant = 12000
                } else if to == .Week {
                    constant = 52142.9
                } else if to == .Day {
                    constant = 365000
                } else if to == .Hour {
                    constant = 8.76e+6
                } else if to == .Minute {
                    constant = 5.256e+8
                } else if to == .Second {
                    constant = 3.154e+10
                } else if to == .Millisecond {
                    constant = 3.154e+13
                } else if to == .Microsecond {
                    constant = 3.154e+16
                } else if to == .Nanosecond {
                    constant = 3.154e+19
                }
            
            case .Century:
                if to == .Millennium {
                    constant = 0.1
                } else if to == .Century {
                    constant = constant + 0
                } else if to == .Decade {
                    constant = 10
                } else if to == .Year {
                    constant = 100
                } else if to == .Month {
                    constant = 1200
                } else if to == .Week {
                    constant = 5214.29
                } else if to == .Day {
                    constant = 36500
                } else if to == .Hour {
                    constant = 876000
                } else if to == .Minute {
                    constant = 5.256e+7
                } else if to == .Second {
                    constant = 3.154e+9
                } else if to == .Millisecond {
                    constant = 3.154e+12
                } else if to == .Microsecond {
                    constant = 3.154e+15
                } else if to == .Nanosecond {
                    constant = 3.154e+18
                }
                
            case .Decade:
                if to == .Millennium {
                    constant = 0.01
                } else if to == .Century {
                    constant = 0.1
                } else if to == .Decade {
                    constant = constant + 0
                } else if to == .Year {
                    constant = 10
                } else if to == .Month {
                    constant = 120
                } else if to == .Week {
                    constant = 521.429
                } else if to == .Day {
                    constant = 3650
                } else if to == .Hour {
                    constant = 87600
                } else if to == .Minute {
                    constant = 5.256e+6
                } else if to == .Second {
                    constant = 3.154e+8
                } else if to == .Millisecond {
                    constant = 3.154e+11
                } else if to == .Microsecond {
                    constant = 3.154e+14
                } else if to == .Nanosecond {
                    constant = 3.154e+17
                }
                
            case .Year:
                if to == .Millennium {
                    constant = 0.001
                } else if to == .Century {
                    constant = 0.01
                } else if to == .Decade {
                    constant = 0.1
                } else if to == .Year {
                    constant = constant + 0
                } else if to == .Month {
                    constant = 12
                } else if to == .Week {
                    constant = 52.1429
                } else if to == .Day {
                    constant = 365
                } else if to == .Hour {
                    constant = 8760
                } else if to == .Minute {
                    constant = 525600
                } else if to == .Second {
                    constant = 3.154e+7
                } else if to == .Millisecond {
                    constant = 3.154e+10
                } else if to == .Microsecond {
                    constant = 3.154e+13
                } else if to == .Nanosecond {
                    constant = 3.154e+16
                }
                
            case .Month:
                if to == .Millennium {
                    constant = 8.3333e-5
                } else if to == .Century {
                    constant = 0.000833334
                } else if to == .Decade {
                    constant = 0.00833334
                } else if to == .Year {
                    constant = 0.0833334
                } else if to == .Month {
                    constant = constant + 0
                } else if to == .Week {
                    constant = 4.34524
                } else if to == .Day {
                    constant = 30.4167
                } else if to == .Hour {
                    constant = 730.001
                } else if to == .Minute {
                    constant = 43800
                } else if to == .Second {
                    constant = 2.628e+6
                } else if to == .Millisecond {
                    constant = 2.628e+9
                } else if to == .Microsecond {
                    constant = 2.628e+12
                } else if to == .Nanosecond {
                    constant = 2.628e+15
                }
                
            case .Week:
                if to == .Millennium {
                    constant = 1.9178e-5
                } else if to == .Century {
                    constant = 0.000191781
                } else if to == .Decade {
                    constant = 0.00191781
                } else if to == .Year {
                    constant = 0.0191781
                } else if to == .Month {
                    constant = 0.230137
                } else if to == .Week {
                    constant = constant + 0
                } else if to == .Day {
                    constant = 7
                } else if to == .Hour {
                    constant = 168
                } else if to == .Minute {
                    constant = 10080
                } else if to == .Second {
                    constant = 604800
                } else if to == .Millisecond {
                    constant = 6.048e+8
                } else if to == .Microsecond {
                    constant = 6.048e+11
                } else if to == .Nanosecond {
                    constant = 6.048e+14
                }
                
            case .Day:
                if to == .Millennium {
                    constant = 2.7397e-6
                } else if to == .Century {
                    constant = 2.7397e-5
                } else if to == .Decade {
                    constant = 0.000273973
                } else if to == .Year {
                    constant = 0.00273973
                } else if to == .Month {
                    constant = 0.0328767
                } else if to == .Week {
                    constant = 0.142857
                } else if to == .Day {
                    constant = constant + 0
                } else if to == .Hour {
                    constant = 24
                } else if to == .Minute {
                    constant = 1440
                } else if to == .Second {
                    constant = 86400
                } else if to == .Millisecond {
                    constant = 8.64e+7
                } else if to == .Microsecond {
                    constant = 8.64e+10
                } else if to == .Nanosecond {
                    constant = 8.64e+13
                }
                
            case .Hour:
                if to == .Millennium {
                    constant = 1.1416e-7
                } else if to == .Century {
                    constant = 1.1416e-6
                } else if to == .Decade {
                    constant = 1.1416e-5
                } else if to == .Year {
                    constant = 0.000114155
                } else if to == .Month {
                    constant = 0.00136986
                } else if to == .Week {
                    constant = 0.00595238
                } else if to == .Day {
                    constant = 0.0416667
                } else if to == .Hour {
                    constant = constant + 0
                } else if to == .Minute {
                    constant = 60
                } else if to == .Second {
                    constant = 3600
                } else if to == .Millisecond {
                    constant = 3.6e+6
                } else if to == .Microsecond {
                    constant = 3.6e+9
                } else if to == .Nanosecond {
                    constant = 3.6e+12
                }
                
            case .Minute:
                if to == .Millennium {
                    constant = 1.9026e-9
                } else if to == .Century {
                    constant = 1.9026e-8
                } else if to == .Decade {
                    constant = 1.9026e-7
                } else if to == .Year {
                    constant = 1.9026e-6
                } else if to == .Month {
                    constant = 2.2831e-5
                } else if to == .Week {
                    constant = 9.9206e-5
                } else if to == .Day {
                    constant = 0.000694444
                } else if to == .Hour {
                    constant = 0.0166667
                } else if to == .Minute {
                    constant = constant + 0
                } else if to == .Second {
                    constant = 60
                } else if to == .Millisecond {
                    constant = 60000
                } else if to == .Microsecond {
                    constant = 6e+7
                } else if to == .Nanosecond {
                    constant = 6e+10
                }
                
            case .Second:
                if to == .Millennium {
                    constant = 3.171e-11
                } else if to == .Century {
                    constant = 3.171e-10
                } else if to == .Decade {
                    constant = 3.171e-9
                } else if to == .Year {
                    constant = 3.171e-8
                } else if to == .Month {
                    constant = 3.8052e-7
                } else if to == .Week {
                    constant = 1.6534e-6
                } else if to == .Day {
                    constant = 1.1574e-5
                } else if to == .Hour {
                    constant = 0.000277778
                } else if to == .Minute {
                    constant = 0.0166667
                } else if to == .Second {
                    constant = constant + 0
                } else if to == .Millisecond {
                    constant = 1000
                } else if to == .Microsecond {
                    constant = 1e+6
                } else if to == .Nanosecond {
                    constant = 1e+9
                }
            case .Millisecond:
                if to == .Millennium {
                    constant = 3.171e-14
                } else if to == .Century {
                    constant = 3.171e-13
                } else if to == .Decade {
                    constant = 3.171e-12
                } else if to == .Year {
                    constant = 3.171e-11
                } else if to == .Month {
                    constant = 3.8052e-10
                } else if to == .Week {
                    constant = 1.6534e-9
                } else if to == .Day {
                    constant = 1.1574e-8
                } else if to == .Hour {
                    constant = 2.7778e-7
                } else if to == .Minute {
                    constant = 1.6667e-5
                } else if to == .Second {
                    constant = 0.001
                } else if to == .Millisecond {
                    constant = constant + 0
                } else if to == .Microsecond {
                    constant = 1000
                } else if to == .Nanosecond {
                    constant = 1e+6
                }
                
            case .Microsecond:
                if to == .Millennium {
                    constant = 3.171e-17
                } else if to == .Century {
                    constant = 3.171e-16
                } else if to == .Decade {
                    constant = 3.171e-15
                } else if to == .Year {
                    constant = 3.171e-14
                } else if to == .Month {
                    constant = 3.8052e-13
                } else if to == .Week {
                    constant = 1.6534e-12
                } else if to == .Day {
                    constant = 1.1574e-11
                } else if to == .Hour {
                    constant = 2.7778e-10
                } else if to == .Minute {
                    constant = 1.6667e-8
                } else if to == .Second {
                    constant = 1e-6
                } else if to == .Millisecond {
                    constant = 0.001
                } else if to == .Microsecond {
                    constant = constant + 0
                } else if to == .Nanosecond {
                    constant = 1000
                }
                
            case .Nanosecond:
                if to == .Millennium {
                    constant = 3.171e-20
                } else if to == .Century {
                    constant = 3.171e-19
                } else if to == .Decade {
                    constant = 3.171e-18
                } else if to == .Year {
                    constant = 3.171e-17
                } else if to == .Month {
                    constant = 3.8052e-16
                } else if to == .Week {
                    constant = 1.6534e-15
                } else if to == .Day {
                    constant = 1.1574e-14
                } else if to == .Hour {
                    constant = 2.7778e-13
                } else if to == .Minute {
                    constant = 1.6667e-11
                } else if to == .Second {
                    constant = 1e-9
                } else if to == .Millisecond {
                    constant = 1e-6
                } else if to == .Microsecond {
                    constant = 0.001
                } else if to == .Nanosecond {
                    constant = constant + 0
                }
            }
            return constant * val
        }
        
        static func fromString(_ string: String) -> Unit? {
            if string == "Millennium" {
                return .Millennium
            } else if string == "Century" {
                return .Century
            } else if string == "Decade" {
                return .Decade
            } else if string == "Year" {
                return .Year
            } else if string == "Month" {
                return .Month
            } else if string == "Week" {
                return .Week
            } else if string == "Day" {
                return .Day
            } else if string == "Hour" {
                return .Hour
            } else if string == "Minute" {
                return .Minute
            } else if string == "Second" {
                return .Second
            } else if string == "Millisecond" {
                return .Millisecond
            } else if string == "Microsecond" {
                return .Microsecond
            } else if string == "Nanosecond" {
                return .Nanosecond
            } else {
                return nil
            }
        }
        
        static func allCases() -> [String] {
            var i = 0
            var list = [String]()
            while let unit = Unit(rawValue: i) {
                list.append(unit.description())
                i = i + 1
            }
            return list
        }
        
    }
    
}


