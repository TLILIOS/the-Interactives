//
//  InteractifsController.swift
//  MesInteractifs
//
//  Created by HTLILI on 06/04/2024.
//

import UIKit

class InteractifsController: UIViewController {

    @IBOutlet weak var stepper: UIStepper!
    
    @IBOutlet weak var segmented: UISegmentedControl!
    
    @IBOutlet weak var stepperLabel: UILabel!
    
    @IBOutlet weak var switchLabel: UILabel!
   
    @IBOutlet weak var mySwitch: UISwitch!
    
    @IBOutlet weak var slider: UISlider!
    
    @IBOutlet weak var labelSlider: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        setupStepperLBL()
        setUpLabelSwitch()
       
    }
    
    
    @IBAction func stepperchanged(_ sender: UIStepper) {
        setupStepperLBL()
    }
    
    @IBAction func slider(_ sender: UISlider) {
        let intValue = Int(sender.value)
        labelSlider.text = "Vitesse: \(intValue) Kms/h"
    }
    
    @IBAction func switchPressed(_ sender: UISwitch) {
        setUpLabelSwitch()
    }
    
    @IBAction func segmentedPressed(_ sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
        case 0:
            print(sender.titleForSegment(at: 0))
        case 1:
            print(sender.titleForSegment(at: 1))
        case 2:
            print(sender.titleForSegment(at: 2))
        default:
            return
        }
    }
    
    func setupStepperLBL() {
        stepperLabel.text = "Nombre de pas: \(stepper.value)"
    }
    func setUpLabelSwitch() {
        switchLabel.textColor = mySwitch.isOn ? .systemGreen : .red
        switchLabel.text = "Je suis On: \(mySwitch.isOn)"
    }
    
}
