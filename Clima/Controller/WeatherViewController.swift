//
//  ViewController.swift
//  Clima
//
//  Created by Angela Yu on 01/09/2019.
//  Copyright © 2019 App Brewery. All rights reserved.
//

import UIKit

class WeatherViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var conditionImageView: UIImageView!
    @IBOutlet weak var temperatureLabel: UILabel!
    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var searchTextField: UITextField!
    
    var weat = WeatherManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //searchTextField will handle the delegate (UITextFieldDelegate)
        searchTextField.delegate = self
    }
    
    @IBAction func searchPressed(_ sender: UIButton) {
        
        if searchTextField.text == "" {
            searchTextField.placeholder = "Type a city."
        }else{
            cityLabel.text = searchTextField.text
            searchTextField.endEditing(true)
            searchTextField.text = nil
        }
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
       // print(searchTextField.text!)
        
        if searchTextField.text == "" {
            searchTextField.placeholder = "Type a city."
        }
        cityLabel.text = searchTextField.text
        searchTextField.endEditing(true)
        return true
    }
    
    //What to do when "Go" button is press in the keyboard
    func textFieldDidEndEditing(_ textField: UITextField) {
        
        //Optional binding, metiendo el texfield en un constant para usarla en un function que necesita un String parameter
        if let city = searchTextField.text {
            weat.fetcWeather(cityName: city)
        }
        searchTextField.text = ""
    }
    
}

