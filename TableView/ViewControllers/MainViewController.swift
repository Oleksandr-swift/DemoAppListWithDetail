//
//  ViewController.swift
//  TableView
//
//  Created by Aleksandr on 19.09.2022.
//

import UIKit

class MainViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var informationTableView: UITableView!
    @IBOutlet weak var navigationBarView: UIView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var controlSegment: UISegmentedControl!
    
    let data: [Sunset] = [
        Sunset(title: "Morning Run", imageName: "sunset1", country: "Italy"),
        Sunset(title: "Evening Sunset", imageName: "sunset2", country: "Ukraine"),
        Sunset(title: "Vacation Photos", imageName: "sunset3", country: "Poland"),
        Sunset(title: "Visiting Frieends", imageName: "sunset4", country: "Czech Republic"),
        Sunset(title: "Some Other Title", imageName: "sunset5", country: "Сroatia"),
    ]
    
    let newData: [Sunset] = [
        Sunset(title: "Sunrise in the field", imageName: "sunrise1", country: "Norway"),
        Sunset(title: "Beautiful sunrise in the mountains", imageName: "sunrise2", country: "Finland"),
        Sunset(title: "Winter sunrise", imageName: "sunrise3", country: "Romania"),
        Sunset(title: "Sunny dawn in a beautiful field", imageName: "sunrise4", country: "Sweden"),
        Sunset(title: "Sunrise on the seaside", imageName: "sunrise5", country: "Austria"),
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupVC()
    }
    
    private func setupVC() {
        informationTableView.dataSource = self
        informationTableView.delegate = self
        titleLabel.text = "Sunset list"
        navigationBarView.backgroundColor = UIColor.lightGray
        controlSegment.setTitle("Sunset", forSegmentAt: 0)
        controlSegment.setTitle("Sunrise", forSegmentAt: 1)
    }
    
    private func navigateToDetailScreen(sunset: Sunset) {
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        let vc = storyboard.instantiateViewController(identifier: "Detail") as DetailScreenViewController
        vc.sunset = sunset
        vc.modalPresentationStyle = .fullScreen
        self.present(vc, animated: false, completion: nil)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return controlSegment.selectedSegmentIndex == 0 ? data.count : newData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let sunset = controlSegment.selectedSegmentIndex == 0 ? data[indexPath.row] : newData[indexPath.row]
        let cell = informationTableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! CustomTableViewCell
        cell.setupUI(data: sunset)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let sunset = controlSegment.selectedSegmentIndex == 0 ? data[indexPath.row] : newData[indexPath.row]
        self.navigateToDetailScreen(sunset: sunset)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 140
    }
    @IBAction func didChangeSegment(_ sender: UISegmentedControl) {
        informationTableView.reloadData()
    }
}

