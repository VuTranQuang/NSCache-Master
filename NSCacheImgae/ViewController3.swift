//
//  ViewController3.swift
//  NSCacheImgae
//
//  Created by Vũ on 3/8/19.
//  Copyright © 2019 Vũ. All rights reserved.
//

import UIKit

class ViewController3: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    let url = URL(string: "https://i.pinimg.com/originals/b4/d2/07/b4d20730ef0b67e224328de8b3c739df.jpg")!
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
                            self.imageView.image = image
                        }
                    } else {
                        print("")
                    }
                } else {
                    print("")
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
