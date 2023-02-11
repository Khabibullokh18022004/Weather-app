

import UIKit

class WeatherViewController: UIViewController, UITextFieldDelegate {
    @IBOutlet weak var conditionImageView: UIImageView!
    @IBOutlet weak var temperatureLabel: UILabel!
    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var searchTextField: UITextField!
    
    //initializing our struct
    var weatherManager = WeatherManager()
    
    @IBAction func searchPressed(_ sender: UIButton) {
       
         searchTextField.endEditing(true)
        print(searchTextField.text!)

    }
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        searchTextField.delegate = self
        
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        searchTextField.endEditing(true)
        print(searchTextField.text!)
        return true
    }
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        if textField.text != ""
        {
            return true
        }else {
            textField.placeholder = "Type smth"
            return false
        }
        
    }
    func textFieldDidEndEditing(_ textField: UITextField) {
        if let city = searchTextField.text{
            weatherManager.fetchWeather(city_name: city)
        }
        searchTextField.text = ""
    }
}

