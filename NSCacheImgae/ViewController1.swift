//
//  ViewController1.swift
//  NSCacheImgae
//
//  Created by Vũ on 3/8/19.
//  Copyright © 2019 Vũ. All rights reserved.
//

import UIKit

class ViewController1: UIViewController {
    @IBOutlet weak var imageView: UIImageView!
    let url = URL(string: "https://upload.wikimedia.org/wikipedia/commons/9/91/David_napoleon.jpg")
    override func viewDidLoad() {
        super.viewDidLoad()
        let session = URLSession(configuration: .default)
        
        
//        let image = NSCache[""]
        let downloadPickTask = session.dataTask(with: url!) { (data, respone, error) in
            if let e = error {
                print("Error Occurred: \(e)")
            } else {
                if respone as? HTTPURLResponse != nil {
                    if let imageData = data {
                        let image = UIImage(data: imageData)
                        self.imageView.image = image
                    } else {
                        print("")
                    }
                } else {
                    print("")
                }
            }
        }
        
        downloadPickTask.resume()
    }

  
    

    

}
