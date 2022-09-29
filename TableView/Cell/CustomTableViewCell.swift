//
//  CustomTableViewCell.swift
//  TableView
//
//  Created by Admin on 19.09.2022.
//

import UIKit

class CustomTableViewCell: UITableViewCell {

    @IBOutlet weak var iconImageView: UIImageView!
    @IBOutlet weak var label: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        iconImageView.layer.cornerRadius = 30
    }
    
    func setupUI(data: Sunset) {
        label.text = data.title
        iconImageView.image = UIImage(named: data.imageName)
    }
}
