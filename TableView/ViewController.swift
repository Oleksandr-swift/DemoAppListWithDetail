//
//  ViewController.swift
//  TableView
//
//  Created by Aleksandr on 19.09.2022.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var Table: UITableView!
    
    struct Sunset {
        let title: String
        let imageName: String
    }
    
    let data: [Sunset] = [
        Sunset(title: "Morning Run", imageName: "sunset1"),
        Sunset(title: "Evening Sunset", imageName: "sunset2"),
        Sunset(title: "Vacation Photos", imageName: "sunset3"),
        Sunset(title: "Visiting Frieends", imageName: "sunset4"),
        Sunset(title: "Some Other Title", imageName: "sunset5"),
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        Table.dataSource = self
        Table.delegate = self
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let sunset = data[indexPath.row]
        let cell = Table.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! CustomTableViewCell
        cell.label.text = sunset.title
        cell.iconImageView.image = UIImage(named: sunset.imageName)
        cell.iconImageView.layer.cornerRadius = 30
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 140
    }
    
}

