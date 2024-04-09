//
//  PickersController.swift
//  MesInteractifs
//
//  Created by HTLILI on 06/04/2024.
//

import UIKit

class PickersController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if component == 0 {
            return arrayPickerF.count
        } else {
            return arrayPickerV.count
        }
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 2
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if component == 0 {
            return arrayPickerF[row]
        } else {
            return arrayPickerV[row]
        }
        
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if component == 0 {
            print(arrayPickerF[row])
        } else {
            print(arrayPickerV[row])
        }
        
    }
    var arrayPickerF = ["Pommes", "Fraise", "Banane", "Raisin"]
    var arrayPickerV = ["Carrottes", "Concombres", "Tomates", "Courgettes", "Brocoli"]
    @IBOutlet weak var datePicker: UIDatePicker!
    
    @IBOutlet weak var pickerView: UIPickerView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        pickerView.delegate = self
        pickerView.dataSource = self
        
    }
    
    @IBAction func dateChanged(_ sender: UIDatePicker) {
        print(sender.date)
    }
    

}
