//
//  ViewController4.swift
//  NSCacheImgae
//
//  Created by Vũ on 3/13/19.
//  Copyright © 2019 Vũ. All rights reserved.
//

import UIKit

class ViewController4: UIViewController {
    @IBOutlet weak var imageView4: UIImageView!
    let url = URL(string: "https://i.pinimg.com/originals/21/36/35/21363553c1e791233535e06dd85db3a6.png")!
    override func viewDidLoad() {
        super.viewDidLoad()
        let session = URLSession(configuration: .default)
        let downloadPickTask = session.dataTask(with: url) { (data, repond, error) in
            if let e = error {
                print("\(e)")
            } else {
                if repond as? HTTPURLResponse != nil {
                    if let imageData = data {
                        let image = UIImage(data: imageData)
                        DispatchQueue.main.async {
                            self.imageView4.image = image
                        }
                    }
//                    else {
//                        print("")
//                    }
                }
//                else {
//                    print("")
//                }
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
