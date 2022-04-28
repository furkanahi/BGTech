//
//  NewListViewController.swift
//  BGTech
//
//  Created by Furkan Ahi on 28.04.2022.
//

import UIKit

class NewListViewController: UIViewController {
    
    @IBOutlet weak var sprintTextView: UITextField!
    @IBOutlet weak var sprintView: UIView!
    @IBOutlet weak var picker: UIPickerView!
    @IBOutlet weak var icon: UIImageView!
    @IBOutlet weak var pickerStack: UIStackView!
    
    var pickerData: [String] = ["Sprint1","Sprint2","Sprint3","Sprint4","Sprint5","Sprint6"]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        picker.delegate = self
        picker.dataSource = self
        picker.isHidden = true
        
        sprintView.layer.borderWidth = 0.2
        sprintTextView.borderStyle = .none
        sprintTextView.text = pickerData[0]
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(tap(gestureReconizer:)))
        
        sprintTextView.addGestureRecognizer(tap)
        pickerStack.addGestureRecognizer(tap)
        sprintView.addGestureRecognizer(tap)
        sprintTextView.inputView = picker
        
        
    }
    @objc func tap(gestureReconizer: UITapGestureRecognizer) {
        print("*")
        picker.isHidden = !picker.isHidden
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
            if touches.first?.view == self.view {
                picker.isHidden = true
            }
    }
}

extension NewListViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerData.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return pickerData[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        sprintTextView.text = pickerData[row]
    }
}
