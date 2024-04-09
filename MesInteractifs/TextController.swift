//
//  TextController.swift
//  MesInteractifs
//
//  Created by HTLILI on 06/04/2024.
//

import UIKit

class TextController: UIViewController, UITextFieldDelegate, UITextViewDelegate {

    @IBOutlet weak var textView: UITextView!
    
    @IBOutlet weak var NameTextField: UITextField!
    
    
    @IBOutlet weak var NameLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let tap = UITapGestureRecognizer(target: self, action: #selector(closeKeyBoard))
        view.addGestureRecognizer(tap)
        NameTextField.delegate = self
        textView.delegate = self
        NotificationCenter.default.addObserver(self, selector: #selector(keyBoardWillApear), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyBoardHide), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    @objc func keyBoardWillApear(_ notification: Notification) {
        if textView.isFirstResponder {
            if let size = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
                let height = size.height
                print(height)
                UIView.animate(withDuration: 0.5) {
                    self.view.center.y -= (height - 200)
                }
            }
        }
    }
    @objc func keyBoardHide(_ notification: Notification) {
        if textView.isFirstResponder {
            if let size = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
                let height = size.height
                print(height)
                UIView.animate(withDuration: 0.5) {
                    self.view.center.y += (height - 200)
                }
            }
        }
    }
    
    func textViewDidBeginEditing(_ textView: UITextView) {
        print("Did Begin")
    }
    
    func textViewDidEndEditing(_ textView: UITextView) {
        print("Did End")
    }
    
    
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        print("Did End Protocol: \(String(describing: textField.text))")
    }
    func textFieldDidBeginEditing(_ textField: UITextField) {
        print("Did Begin Protocol: \(String(describing: textField.text))")
    }
    func textFieldDidChangeSelection(_ textField: UITextField) {
        print("Did Change Selection Protocol: \(String(describing: textField.text))")
        NameLabel.text = textField.text
    }
    func textFieldDidEndEditing(_ textField: UITextField, reason: UITextField.DidEndEditingReason) {
        print("Did End Editing for reason Protocol: \(String(describing: textField.text)) \(reason)")
        //NameLabel.text = textField.text
    }
    func textFieldShouldClear(_ textField: UITextField) -> Bool {
        print("Should Clear Protocol: \(String(describing: textField.text))")
        return true
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        print("Should Return Protocol: \(String(describing: textField.text))")
        return true
    }
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        print("Should Begin Editing Protocol: \(String(describing: textField.text))")
        return true
    }
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        print("Should End Editing Protocol: \(String(describing: textField.text))")
        return true
    }
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        print("Should Change Characters Protocol: \(String(describing: textField.text)) + \(range) + remplacement \(string)")
        return true
    }

    
    @objc func closeKeyBoard() {
        view.endEditing(true)
    }


    @IBAction func nameTFDidEnd(_ sender: UITextField) {
        print("Did end editing : \( sender.text!)")
    }
    
    
}
