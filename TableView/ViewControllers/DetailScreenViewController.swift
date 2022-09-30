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
    
    var sunset: Sunset?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if let sunset = sunset {
            setupData(sunset: sunset)
        }
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
