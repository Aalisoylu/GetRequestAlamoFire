//
//  ViewController.swift
//  GetRequestAlamoFire
//
//  Created by Muhammed Ali SOYLU on 3.02.2023.
//

import UIKit
import Alamofire

class ViewController: UIViewController {
    
    
    var apiResult = [Model]()
    
    @IBOutlet weak var apiTableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        apiTableView.delegate = self
        apiTableView.dataSource = self
        // Do any additional setup after loading the view.
        APIHandler.shared.fetchingAPIDATA { apiData in
            self.apiResult = apiData
            
            DispatchQueue.main.async {
                self.apiTableView.reloadData()
            }
        }
        
    }
    
    
    @IBAction func listButtonClicked(_ sender: Any) {
        
        
    }
    
    
    

}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return apiResult.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell") else { return UITableViewCell() }
        cell.textLabel?.text = String(apiResult[indexPath.row].title)
        return cell
    }
    
}

