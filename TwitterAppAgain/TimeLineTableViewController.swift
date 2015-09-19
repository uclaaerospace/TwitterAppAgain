//
//  TimelineTableViewController.swift
//  TwitterAppAgain
//
//  Created by yoshihisa haruyama on 9/19/15.
//  Copyright (c) 2015 yoshihisa haruyama. All rights reserved.
//

import UIKit

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

    
    
}
