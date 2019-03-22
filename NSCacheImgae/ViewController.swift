//
//  ViewController.swift
//  NSCacheImgae
//
//  Created by Vũ on 3/8/19.
//  Copyright © 2019 Vũ. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    //let url = URL(string: "https://upload.wikimedia.org/wikipedia/commons/9/91/David_napoleon.jpg")
    

    
    
    let url = URL(string: "https://twistedsifter.files.wordpress.com/2018/05/phantee.jpg?w=800&h=529")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let session = URLSession(configuration: .default)
        let downloadPickTask = session.dataTask(with: url!) { (data, respone, error) in
            if let e  = error {
                print("Error Occurred: \(e)")
            } else {
                if respone as? HTTPURLResponse != nil {
                    if let imageData = data {
                        let image = UIImage(data: imageData)
                        DispatchQueue.main.async {
                            self.imageView.image = image
                        }
                    } else {
                        print("Image file is currupted")
                    }
                } else {
                    print("No respone from server")
                }
            }
        }
        downloadPickTask.resume()
       
    }

  
}

