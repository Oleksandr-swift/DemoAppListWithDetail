//
//  ViewController.swift
//  TableView
//
//  Created by Aleksandr on 19.09.2022.
//

import UIKit

class MainViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var informationTableView: UITableView!
    @IBOutlet weak var navigationBar: UINavigationBar!
    
    let data: [Sunset] = [
        Sunset(title: "Morning Run", imageName: "sunset1"),
        Sunset(title: "Evening Sunset", imageName: "sunset2"),
        Sunset(title: "Vacation Photos", imageName: "sunset3"),
        Sunset(title: "Visiting Frieends", imageName: "sunset4"),
        Sunset(title: "Some Other Title", imageName: "sunset5"),
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        informationTableView.dataSource = self
        informationTableView.delegate = self
        navigationBar.items?.first?.title = "Sunset list"
        navigationBar.backgroundColor = .red
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let sunset = data[indexPath.row]
        let cell = informationTableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! CustomTableViewCell
        cell.setupUI(data: sunset)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(data[indexPath.row].title)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 140
    }
    
}

