//
//  ImageCell.swift
//  MercuryBrowser
//
//  Created by Minh Ly on 10/7/19.
//  Copyright © 2019 Minh Ly. All rights reserved.
//

import UIKit

class ImageCell: UITableViewCell {
    @IBOutlet weak var imageViewer: UIImageView!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var type: UILabel!
    
    func getImage(url: String) {
        if let url = URL(string: url) {
            let request = URLRequest(url: url)
            let session = URLSession(configuration: .ephemeral)
            let task = session.dataTask(with: request) { (data, response, error) in
                DispatchQueue.main.async {
                    if let data = data {
                        self.imageViewer.image = UIImage(data: data)
                    }
                }
            }
            task.resume()
        }
    }
}
