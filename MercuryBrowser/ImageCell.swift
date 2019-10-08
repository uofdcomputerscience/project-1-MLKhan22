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
        // download the image, and call the completion with the url and image.
        // the cell can then verify that the image being returned is the one
        // requested.
        // you may even keep a dictionary of results, and then call the completion
        // with an entry from that dictionary, if one exists, otherwise make the
        // network call and store its result in the dictionary as well as calling
        // the completion. This would allow the _second_ call for any image to not
        // perform a network operation!
        //}
        if let url = URL(string: url) {
            let request = URLRequest(url: url)
            let session = URLSession(configuration: .ephemeral) //Set up time to do configuration over the network
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
