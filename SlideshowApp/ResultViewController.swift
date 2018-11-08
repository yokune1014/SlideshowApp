//
//  ResultViewController.swift
//  SlideshowApp
//
//  Created by Nana Takase on 2018/11/08.
//  Copyright © 2018 yokune1014. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController {
  
  var imgName : String! //表示する画像名
  @IBOutlet weak var imageView: UIImageView!
  
    override func viewDidLoad() {
        super.viewDidLoad()

        imageView.image = UIImage(named: imgName)
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
