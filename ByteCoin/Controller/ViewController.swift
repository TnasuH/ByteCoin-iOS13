//
//  ViewController.swift
//  ByteCoin
//
//  Created by Angela Yu on 11/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController  {
    
    // MARK: initalizing
    @IBOutlet weak var bitcoinLblUI: UILabel!
    @IBOutlet weak var currencyLblUI: UILabel!
    @IBOutlet weak var currencyPickerUI: UIPickerView!
    
    var coinManager = CoinManager()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        currencyPickerUI.dataSource = self
        currencyPickerUI.delegate = self
        coinManager.delegate = self
        coinManager.fetchCurrency(currency: "USD")
        
    }
}

// MARK: - CoinManagerDelegate Extension

extension ViewController : CoinManagerDelegate {
    
    func didUpdateCoin(_ CoinManager: CoinManager, coin: CoinModel) {
        DispatchQueue.main.async {
            self.bitcoinLblUI.text = coin.assetIDQuote
            self.currencyLblUI.text = coin.rateString
        }
    }
    
    func didFailWithError(error: Error) {
        DispatchQueue.main.async {
            print(error)
            let alertController = UIAlertController(title: "There was an error", message: "\(error)", preferredStyle: .alert)
            
            // Create the actions
            let okAction = UIAlertAction(title: "Ok", style: .default)
            
            // Add the actions
            alertController.addAction(okAction)
            
            // Present the controller
            self.present(alertController, animated: true)
        }
    }
}

// MARK: - UIPicker DataSource Functions

extension ViewController : UIPickerViewDataSource {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return coinManager.currencyArray.count
    }
}

// MARK: - UIPicker Delegate Functions

extension ViewController : UIPickerViewDelegate {
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return coinManager.currencyArray[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        let selectedCurrency = coinManager.currencyArray[row]
        coinManager.fetchCurrency(currency: selectedCurrency)
    }
}




