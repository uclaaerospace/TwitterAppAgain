//
//  TimelineTableViewController.swift
//  TwitterAppAgain
//
//  Created by yoshihisa haruyama on 9/19/15.
//  Copyright (c) 2015 yoshihisa haruyama. All rights reserved.
//

import UIKit
import Social

class TimeLineTableViewController: UITableViewController {

    let dataArray:[[String:String]] = [
        [   "title":"タイトル1",
            "image" : "http://goo.gl/mWPR9w"
        
        
        ],
        [   "title":"タイトル2",
            "image": "http://goo.gl/qFhR0R"
        
        ]
    
    ]

   
    
    //テーブルの件数を登録
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataArray.count
    }
    
    //テーブルの内容を代入
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        //セルを内部的にリサイクルしているのでこちらが必須になります。
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) as! TimeLineTableViewCell
        
        cell.tweetLabel.text = dataArray[indexPath.row]["title"]
        
        if let imageURLString = dataArray[indexPath.row]["image"]
            , let imageURL = NSURL(string: imageURLString){
                
    
        cell.iconImageView.sd_setImageWithURL(imageURL)
                
        }
        return cell
    
    }

    @IBAction func tapTweetButton(sender: UIBarButtonItem) {
        
        if SLComposeViewController.isAvailableForServiceType(SLServiceTypeTwitter) {
            
            let vc = SLComposeViewController(forServiceType: SLServiceTypeTwitter)
            
            //CancelもしくはPostを押した際に呼ばれ、投稿画面を閉じる処理を行っています。
            vc.completionHandler = {(result:SLComposeViewControllerResult) -> () in
                vc.dismissViewControllerAnimated(true, completion:nil)
            }
            
            ////投稿画面の初期値設定
            //vc.setInitialText("初期テキストを設定できます。")
            //vc.addURL(NSURL(string:"シェアURLを設定できます。"))
            self.presentViewController(vc, animated: true, completion: nil)
            
        }else{
            let alert = UIAlertController(title: "エラー", message: "Twitterアカウントが登録されていません。設定アプリを開きますか？", preferredStyle: UIAlertControllerStyle.Alert)
            
            alert.addAction(UIAlertAction(title: "はい", style: UIAlertActionStyle.Default, handler: { (action) -> Void in
                if let URL = NSURL(string: UIApplicationOpenSettingsURLString){
                    UIApplication.sharedApplication().openURL(URL)
                }
            }))
            
            alert.addAction(UIAlertAction(title: "いいえ", style: UIAlertActionStyle.Default, handler:nil))
            self.presentViewController(alert, animated: true, completion: nil)
            
        }
        
        
    }
    
    
}
