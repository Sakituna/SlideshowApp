//
//  ViewController.swift
//  SlideshowApp
//
//  Created by Sakiko Watanabe on 2021/07/13.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var startButton: UIButton!
    @IBOutlet weak var theBackButton: UIButton!
    @IBOutlet weak var theForwardButton: UIButton!
    @IBOutlet weak var imageView: UIImageView!
    
    // 配列に指定するindex番号を宣言
    var nowIndex:Int = 0
    // スライドショーに使用するタイマーを宣言
    var timer: Timer!
    // スライドショーさせる画像の配列を宣言
    var imageArray:[UIImage] = [
        UIImage(named: "tuna01")!,
        UIImage(named: "tuna02")!,
        UIImage(named: "tuna03")!
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func tapAction(_ sender: Any) {
        //タップしたときの動き
    }
    
    @IBAction func slideShowButton(_ sender: Any) {
        // 再生中か停止しているかを判定
        if (timer == nil) {
            // 再生時の処理を実装
            
            // タイマーをセットする
            timer = Timer.scheduledTimer(timeInterval: 2.0, target: self, selector: #selector(changeImage), userInfo: nil, repeats: true)
            
            // ボタンの名前を停止に変える
            startButton.setTitle("■", for: .normal)
            
            //再生時、戻る・進むボタンを無効にする
            theForwardButton.isEnabled = false
            theBackButton.isEnabled = false
            
        } else {
            // 停止時の処理を実装
            // タイマーを停止する
            timer.invalidate()
            
            //タイマーを削除しておく(timer.invalidateだけだとtimerがnilにならないため)
            timer = nil
            
            // ボタンの名前を再生に直しておく
            startButton.setTitle("●", for: .normal)
            
            //停止時、戻る・進むボタンを有効にする
            theForwardButton.isEnabled = true
            theBackButton.isEnabled = true
        }
    }
    
    @IBAction func forwardButton(_ sender: Any) {
        // indexを増やして表示する画像を切り替える
        nowIndex += 1
        
        // indexが表示予定の画像の数と同じ場合
        if (nowIndex == imageArray.count) {
            // indexを一番最初の数字に戻す
            nowIndex = 0
            
        }
        // indexの画像をstoryboardの画像にセットする
        imageView.image = imageArray[nowIndex]
        
    }
    
    @IBAction func backButton(_ sender: Any) {
        // indexを増やして表示する画像を切り替え
        nowIndex -= 1
        
        if (nowIndex == imageArray.count) {
            nowIndex = 0
        }
        if (nowIndex <= -1){
            nowIndex = 2
        }
        imageView.image = imageArray[nowIndex]
    }
    
    @objc func changeImage() {
        // indexを増やして表示する画像を切り替える
        nowIndex += 1
        
        // indexが表示予定の画像の数と同じ場合
        if (nowIndex == imageArray.count) {
            // indexを一番最初の数字に戻す
            nowIndex = 0
            
        }
        // indexの画像をstoryboardの画像にセットする
        imageView.image = imageArray[nowIndex]
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // segueから遷移先のResultViewControllerを取得する
        let resultViewController:ResultViewController = segue.destination as! ResultViewController
        // 遷移先のResultViewControllerで宣言している値を代入して渡す
        resultViewController.tapImage = imageView.image
        
        if (timer == nil) {
            // 再生時の処理を実装
            
            // タイマーをセットする
            timer = Timer.scheduledTimer(timeInterval: 2.0, target: self, selector: #selector(changeImage), userInfo: nil, repeats: true)
            
            // ボタンの名前を停止に変える
            startButton.setTitle("■", for: .normal)
            
            //再生時、戻る・進むボタンを無効にする
            theForwardButton.isEnabled = false
            theBackButton.isEnabled = false
            
        } else {
            // 停止時の処理を実装
            // タイマーを停止する
            timer.invalidate()
            
            //タイマーを削除しておく(timer.invalidateだけだとtimerがnilにならないため)
            timer = nil
            
            // ボタンの名前を再生に直しておく
            startButton.setTitle("●", for: .normal)
            
            //停止時、戻る・進むボタンを有効にする
            theForwardButton.isEnabled = true
            theBackButton.isEnabled = true
        }

    }
    
    //戻るボタンの処理
    @IBAction func unwind(_ segue: UIStoryboardSegue) {
    }
    
}


