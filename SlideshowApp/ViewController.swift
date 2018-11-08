//
//  ViewController.swift
//  SlideshowApp
//
//  Created by Nana Takase on 2018/11/08.
//  Copyright © 2018 yokune1014. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
  let imgArray = ["IMG_1","IMG_2","IMG_3","IMG_4","IMG_5"] //画像名格納用
  var tmpImg = 0 //現在の画像が格納されている配列要素
  var isAuto = false //タイマー再生判定
  var timer :Timer!
  
  @IBOutlet weak var imageView: UIImageView!
  @IBOutlet weak var backButton: UIButton!
  @IBOutlet weak var nextButton: UIButton!
  @IBOutlet weak var autoButton: UIButton!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
    
    //ImageView設定
    imageView.image = UIImage(named: imgArray[tmpImg])
    
  }
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
  
  @objc func updateTimer(_ timer: Timer) {
    if tmpImg == imgArray.endIndex - 1{
      //最終要素の場合、先頭要素を指定
      tmpImg = imgArray.startIndex
    }else{
      //上記以外の場合、要素を+1
      tmpImg += 1
    }
    //画像を設定
    imageView.image = UIImage(named: imgArray[tmpImg])
  }
  
  //戻るボタン押下時
  @IBAction func backButton(_ sender: Any) {
    if tmpImg == imgArray.startIndex{
      //先頭要素の場合、最終要素を指定
      tmpImg = imgArray.endIndex - 1
    }else{
      //上記以外の場合、要素を−1
      tmpImg -= 1
    }
    //画像を設定
    imageView.image = UIImage(named: imgArray[tmpImg])
  }
  
  //進むボタン押下時
  @IBAction func nextButton(_ sender: Any) {
    if tmpImg == imgArray.endIndex - 1{
      //最終要素の場合、先頭要素を指定
      tmpImg = imgArray.startIndex
    }else{
      //上記以外の場合、要素を+1
      tmpImg += 1
    }
    //画像を設定
    imageView.image = UIImage(named: imgArray[tmpImg])
  }
  
  //再生・停止ボタン押下時
  @IBAction func autoButton(_ sender: Any) {
    if isAuto == true {
      //再生中の場合、タイマー停止
      isAuto = false
      self.timer.invalidate()
      
      //ボタン設定
      autoButton.setTitle("再生", for: .normal)
      backButton.isEnabled = true
      nextButton.isEnabled = true

    }else{
      //停止中の場合、タイマー開始
      isAuto = true
      self.timer =   Timer.scheduledTimer(timeInterval: 2.0, target: self, selector: #selector(updateTimer(_:)), userInfo: nil, repeats: true)
      
       //ボタン設定
      autoButton.setTitle("停止", for: .normal)
      backButton.isEnabled = false
      nextButton.isEnabled = false

    }
  }
  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    if isAuto == true {
      //再生中の場合、タイマー停止
      isAuto = false
      self.timer.invalidate()
      
      //ボタン設定
      autoButton.setTitle("再生", for: .normal)
      backButton.isEnabled = true
      nextButton.isEnabled = true
    }
    // segueから遷移先のResultViewControllerを取得する
    let resultViewController:ResultViewController = segue.destination as! ResultViewController
    
    // 遷移先のResultViewControllerに表示する画像名を渡す
    resultViewController.imgName = imgArray[tmpImg]
  }
  
  @IBAction func unwind(_ segue: UIStoryboardSegue) {
     //遷移先から戻ってきたとき
  }
}

