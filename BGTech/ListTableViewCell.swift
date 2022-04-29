//
//  ListTableViewCell.swift
//  BGTech
//
//  Created by Furkan Ahi on 13.04.2022.
//

import UIKit

class ListTableViewCell: UITableViewCell {

    @IBOutlet weak var workCode: UILabel!
    @IBOutlet weak var workCode2: UILabel!
    @IBOutlet weak var definition: UILabel!
    @IBOutlet weak var definition2: UILabel!
    @IBOutlet weak var sp: UILabel!
    @IBOutlet weak var spText: UITextField!
    @IBOutlet weak var normalizedSp: UILabel!
    @IBOutlet weak var normalizedSpText: UITextField!
    @IBOutlet weak var plannedEndDate: UILabel!
    @IBOutlet weak var plannedEndDateText: UITextField!
    @IBOutlet weak var endDate: UILabel!
    @IBOutlet weak var endTextDate: UITextField!
    @IBOutlet weak var workPoint: UILabel!
    @IBOutlet weak var workPointText: UITextField!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()

        contentView.frame = contentView.frame.inset(by: UIEdgeInsets(top: 10, left: 0, bottom: 10, right: 0))
    }
}
