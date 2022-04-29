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
    @IBOutlet weak var headerLabel: UILabel!
    @IBOutlet weak var tableView: UITableView!
    
    var pickerData: [String] = ["Sprint1","Sprint2","Sprint3","Sprint4","Sprint5","Sprint6"]
    
    var dataSource: [String] = ["BGTEC-2421233213 123 1231 32 32113 2", "BGTEC-252", "BGTEC-142", "BGTEC-254", "BGTEC-121", "BGTEC-233", "BGTEC-245", "BGTEC-211"]
    
    var dataSource2: [String] = ["1.iş 123 12 12 321 12 132 1 23", "4.iş", "3.iş", "12.iş", "231.iş", "11.iş", "7.iş", "1.iş uzun uzun uzun zuzun uzun"]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        picker.delegate = self
        picker.dataSource = self
        picker.isHidden = true
        
        sprintView.layer.borderWidth = 0.2
        sprintView.layer.borderColor = .init(gray: 0.8, alpha: 1)
        sprintTextView.borderStyle = .none
        sprintTextView.text = pickerData[0]
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(tap(gestureReconizer:)))
        
        sprintTextView.addGestureRecognizer(tap)
        pickerStack.addGestureRecognizer(tap)
        sprintView.addGestureRecognizer(tap)
        sprintTextView.inputView = picker
        
        tableView.delegate = self
        tableView.dataSource = self
        
        
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

extension NewListViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell",  for: indexPath) as! ListTableViewCell
        cell.workCode2.text = dataSource[indexPath.row]
        cell.definition2.text = dataSource2[indexPath.row]
        cell.layer.masksToBounds = true
        cell.contentView.layer.cornerRadius = cell.frame.width / 50
        cell.contentView.layer.borderWidth = 0.7
        cell.contentView.layer.shadowOffset = CGSize(width: -1, height: 1)
        cell.contentView.layer.borderColor = .init(gray: 0.8, alpha: 1)
        cell.contentView.backgroundColor = UIColor(white: 0.98, alpha: 1)
        cell.workCode2.preferredMaxLayoutWidth = 140
        cell.definition2.preferredMaxLayoutWidth = 140
//        let text = VerticalTopAlignLabel()
//        let def = VerticalTopAlignLabel.drawText(text)
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource.count
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let margin = UIView(frame: CGRect(x: 0, y: 0, width: tableView.frame.size.width, height: 5))
        return margin
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 0
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
