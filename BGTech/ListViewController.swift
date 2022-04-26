//
//  ListViewController.swift
//  BGTech
//
//  Created by Furkan Ahi on 13.04.2022.
//

import UIKit

class ListViewController: UIViewController {
    
    @IBOutlet weak var headerLabel: UILabel!
    @IBOutlet weak var tableView: UITableView!
    
    var dataSource: [String] = ["hllhjkh hh kjklkjlk kjk asdfasdf qwel k hll","uzunuzunuzunuzun uzun uzun uzun uzu nuzun uzunuzun  uzun uzunuzun uzunu zun uzun uzun uzun uzun uzunu zunu zunuzun  uzun uz unuzun uzun uzun uzun uzunuz unuzunuzun  uzun uzun uzun uzun uzun uzun uzunuzun", "uzunuzunuzu nuzun uzun uzun uzun uzunu zunuzunuzun  uzun uzunuzun uzunuzunuzun uzun uzun uzun uzunuzunuzunuzun  uzun uz unuzun uzun uzun uzun uzunuzunuzunuzun  uzun uzun uzun uzun uzun uzun uzunuzun", "uzunuzunuzunuzun uzun uzun uzun uzunuzunuzunuzun  uzun uzunuzun uzunuzunuzun uzun uzun uzun uzunuzunuzunuzun  uzun uz unuzun uzun uzun uzun uzunuzunuzunuzun  uzun uzun uzun uzun uzun uzun uzunuzun", "kısa", "kısa"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.estimatedRowHeight = 100.0
        tableView.rowHeight = UITableView.automaticDimension
    }
}

extension ListViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell",  for: indexPath) as! ListTableViewCell
        cell.workCode2.text = dataSource[indexPath.row]
        cell.layer.masksToBounds = true
        cell.layer.cornerRadius = cell.frame.width / 50
        cell.layer.borderWidth = 0.7
        cell.layer.shadowOffset = CGSize(width: -1, height: 1)
        cell.layer.borderColor = .init(gray: 0.8, alpha: 1)
        cell.backgroundColor = UIColor(white: 0.98, alpha: 1)
//        let text = VerticalTopAlignLabel()
//        let def = VerticalTopAlignLabel.drawText(text)
//
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return dataSource.count
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let margin = UIView(frame: CGRect(x: 0, y: 0, width: tableView.frame.size.width, height: 5))
        //margin.backgroundColor = UIColor.clear
        return margin
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 5.0
    }
}

class VerticalTopAlignLabel: UILabel {

    override func drawText(in rect:CGRect) {
        guard let labelText = text else {  return super.drawText(in: rect) }

        let attributedText = NSAttributedString(string: labelText, attributes: [NSAttributedString.Key.font: font!])
        var newRect = rect
        newRect.size.height = attributedText.boundingRect(with: rect.size, options: .usesLineFragmentOrigin, context: nil).size.height

        if numberOfLines != 0 {
            newRect.size.height = min(newRect.size.height, CGFloat(numberOfLines) * font.lineHeight)
        }

        super.drawText(in: newRect)
    }

}
