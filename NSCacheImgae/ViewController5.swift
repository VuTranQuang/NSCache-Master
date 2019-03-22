//
//  ViewController5.swift
//  NSCacheImgae
//
//  Created by Vũ on 3/13/19.
//  Copyright © 2019 Vũ. All rights reserved.
//

import UIKit

class ViewController5: UIViewController {

    @IBOutlet var imageView5: UIImageView!
    let url = URL(string: "https://images-cdn.9gag.com/photo/aR3o76B_700b.jpg")
    override func viewDidLoad() {
        super.viewDidLoad()
        let session = URLSession(configuration: .default)
        let downloadPickTask = session.dataTask(with: url!) { (data, reponed, error) in
            if let e = error {
                print("\(e)")
            } else {
                if reponed as? HTTPURLResponse != nil {
                    if let imageData = data {
                        let image = UIImage(data: imageData)
                        DispatchQueue.main.async {
                            self.imageView5.image = image
                        }
                    }
                }
            }
        }
        downloadPickTask.resume()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
