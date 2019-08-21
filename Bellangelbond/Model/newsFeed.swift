//
//  newsFeed.swift
//  Bellangelbond
//
//  Created by Juan Moreno on 8/17/19.
//  Copyright © 2019 Juan Moreno. All rights reserved.
//

import UIKit

class newFeed: NSObject {
    
    
    
    let url: URL 
    let thumbURL: URL
    let title: String
    let subtitle: String
    let bodyText: String?
    let urlempty = "www.domain.com/emptyvideo"
    init(url: String, thumbURL: String, title: String, subtitle: String, bodyText: String?) {
        
        self.url = URL(string: url) ?? URL (string: "www.domain.com/emptyvideo")!
        self.thumbURL = URL(string: thumbURL) ?? URL (string: "www.domain.com/emptyvideo")!
        self.title = title
        self.subtitle = subtitle
        if let a = bodyText {
            self.bodyText = a
        } else {
            self.bodyText = ""
        }
        super.init()
    }
    
    class func localNEws() -> [newFeed] {
        var videos: [newFeed] = []
        let names = ["newYorkFlip", "bulletTrain", "monkey", "shark"]
        let titles = ["New York Flip", "Bullet Train Adventure", "Monkey Village", "Robot Battles"]
        let subtitles = ["Can this guys really flip all of his bros? You'll never believe what happens!",
                         "Enjoying the soothing view of passing towns in Japan",
                         "Watch as a roving gang of monkeys terrorizes the top of this mountain!",
                         "Have you ever seen a robot shark try to eat another robot?"]
        let bobyTexts = ["Can this guys really flip all of his bros? You'll never believe what happens!",
                         "Enjoying the soothing view of passing towns in Japan",
                         "Watch as a roving gang of monkeys terrorizes the top of this mountain!",
                         "Have you ever seen a robot shark try to eat another robot?"]
        
        for (index, name) in names.enumerated() {
            let urlPath = Bundle.main.path(forResource: name, ofType: "mp4")!
           // let url = URL(fileURLWithPath: urlPath)
            let thumbURLPath = Bundle.main.path(forResource: name, ofType: "png")!
            //let thumbURL = URL(fileURLWithPath: thumbURLPath)
            
            let video = newFeed(url: urlPath, thumbURL: thumbURLPath, title: titles[index], subtitle: subtitles[index], bodyText: bobyTexts[index])
            videos.append(video)
        }
        return videos
    }
    
  
    class func allVideos() -> [newFeed] {
        var videos = localNEws()
        let videoURLString = "https://wolverine.raywenderlich.com/content/ios/tutorials/video_streaming/foxVillage.mp4"
        
        // Add one remote video
        if let url = URL(string: videoURLString) {
            let thumbURLPath = Bundle.main.path(forResource: "foxVillage", ofType: "png")!
           // let thumbURL = URL(fileURLWithPath: thumbURLPath)
            
            let remoteVideo = newFeed(url: videoURLString, thumbURL: thumbURLPath, title: "キツネ村", subtitle: "Will we be mauled by vicious foxes? Tune in to find out!", bodyText: "")
            videos.append(remoteVideo)
        }
        
        return videos
    }

    
}

