//
//  ViewController.swift
//  teotimer
//
//  Created by chocopuyo on 2014/11/14.
//  Copyright (c) 2014年 chocopuyo. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    var myAudioPlayer : AVAudioPlayer!
    var timer : NSTimer!
    var clickTime : Double!
    //var nowCountFlag = false
    var diffTime :Double!
    override func viewDidLoad() {
        super.viewDidLoad()
        //再生する音源のURLを生成.
        let soundFilePath : NSString = NSBundle.mainBundle().pathForResource("chime", ofType: "wav")!
        let fileURL = NSURL(fileURLWithPath: soundFilePath)
        //AVAudioPlayerのインスタンス化.
        myAudioPlayer = AVAudioPlayer(contentsOfURL: fileURL, error: nil)
        }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBOutlet weak var timerButton: UIButton!
    @IBOutlet weak var mainView: UIView!
    @IBAction func touchButton(sender: AnyObject) {
        //timerが動いてるなら.
        if timer != nil && timer.valid == true {
            //timerを破棄する.
            timer.invalidate()
            //ボタンのタイトル変更.
            timerButton.setTitle("Start", forState: UIControlState.Normal)
        }
        else{
            //timerを生成する.
            clickTime = CACurrentMediaTime()
            timer = NSTimer.scheduledTimerWithTimeInterval(0.1, target: self, selector: Selector("update"), userInfo: nil, repeats: true)
            //ボタンのタイトル変更.
            timerButton.setTitle("Start", forState: UIControlState.Normal)
        }
    }
    func update() {
        diffTime = CACurrentMediaTime()-clickTime
        var intDiffTime = 100-Int(diffTime)
        timerButton.setTitle(String(intDiffTime), forState: .Normal)
        if (intDiffTime+20)%30==0 && intDiffTime != 100{
            //再生する音源のURLを生成.
            myAudioPlayer.play()
        }
        if intDiffTime==10 || intDiffTime==5 || intDiffTime==0{
            myAudioPlayer.play()
        }
        if intDiffTime<=0{
            //timerを生成する.
            //timer = NSTimer.scheduledTimerWithTimeInterval(1.0, target: self, selector: Selector("update"), userInfo: nil, repeats: true)
            //ボタンのタイトル変更.
            timer.invalidate()
            timerButton.setTitle("Start", forState: UIControlState.Normal)
        }
    }
}


