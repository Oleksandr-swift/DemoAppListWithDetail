//
//  DetailScreenViewController.swift
//  TableView
//
//  Created by Admin on 30.09.2022.
//

import UIKit

class DetailScreenViewController: UIViewController {
    
    @IBOutlet weak var detailImageView: UIImageView!
    @IBOutlet weak var fullDescriptionLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    
   
    var sunset: Sunset?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupVC()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if let sunset = sunset {
            setupData(sunset: sunset)
        }
    }
    
    func setupVC() {
        titleLabel.text = "Sunset"
        titleLabel.font = UIFont(name: "System", size: 20)
        titleLabel.textColor = .black
        detailImageView.layer.cornerRadius = 15
        detailImageView.contentMode = .scaleToFill
    }
    
    @IBAction func backButton(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
    // MARK: - SetupUI
    
    func setupData(sunset: Sunset) {
        detailImageView.image = UIImage(named: sunset.imageName)
        fullDescriptionLabel.text = sunset.title
    }
}
