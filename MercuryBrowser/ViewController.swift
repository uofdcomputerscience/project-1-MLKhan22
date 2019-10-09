//
//  ViewController.swift
//  MercuryBrowser
//
//  Created by Minh Ly on 10/7/19.
//  Copyright © 2019 Minh Ly. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var tableViewer: UITableView!
    
    let urlString = "https://raw.githubusercontent.com/rmirabelli/mercuryserver/master/mercury.json"
    var mercuryList:MercuryList?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableViewer.register(UITableViewCell.self, forCellReuseIdentifier: "UITableViewCell")
        self.tableViewer.dataSource = self
        
        if let url = URL(string: urlString) {
            let request = URLRequest(url: url)
            let session = URLSession(configuration: .ephemeral)
            let task = session.dataTask(with: request) { (data, response, error) in
                self.mercuryList = try! JSONDecoder().decode(MercuryList.self, from: data!)
                DispatchQueue.main.async {
                    self.tableViewer.reloadData()
                }
            }
            task.resume()
        }
        
    }
    
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return mercuryList?.mercury.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ImageCell", for: indexPath)
            as! ImageCell
        cell.type?.text = mercuryList?.mercury[indexPath.item].type
        cell.name?.text = mercuryList?.mercury[indexPath.item].name
        cell.imageViewer.image = nil
        cell.getImage(url: mercuryList!.mercury[indexPath.item].url)
        return cell
    }
    
}
