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
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var answersStackView: UIStackView!
    @IBOutlet var answersButtons: [UIButton]!
    
    var sunset: Sunset?
    let countries: [String] = ["Italy",
                             "Ukraine",
                             "Poland",
                             "Czech Republic",
                             "Сroatia",
                             "Sweden",
                             "France",
                             "Spain",
                             "USA",
                             "Cannada",
                             "Great Britain",
                             "Belgium",
                             "Moldova",
                             "Turkey",
                             "Egypt"
    ]
    
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
        titleLabel.backgroundColor = UIColor.red
        detailImageView.layer.cornerRadius = 15
        detailImageView.contentMode = .scaleToFill
        questionLabel.text = "Where was this great photo taken?"
        questionLabel.textColor = .red
        questionLabel.numberOfLines = 2
        for button in answersButtons {
            button.backgroundColor = .white
            button.layer.borderWidth = 2
            button.layer.cornerRadius = 5
            button.layer.borderColor = UIColor.black.cgColor
        }
    }
    
    @IBAction func backButton(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func didTapAnswerButton(_ sender: UIButton) {
        sender.titleLabel?.text
        print(  sender.titleLabel?.text)
    }
    
    // MARK: - SetupUI
    
    func setupData(sunset: Sunset) {
        detailImageView.image = UIImage(named: sunset.imageName)
        fullDescriptionLabel.text = sunset.title
        setupAnswers(country: sunset.country)
    }
    
    func setupAnswers(country: String) {
        let firstWrongAnswer = countries.filter { $0 != country }.randomElement()
        let secondWrongAnswer = countries.filter { $0 != firstWrongAnswer && $0 != country }.randomElement()
        let shufledArray = [country, firstWrongAnswer, secondWrongAnswer].shuffled()
        var index = 0
        for button in answersButtons {
            button.setTitle(shufledArray[index], for: .normal)
            index += 1
        }
    }
    
    
}

