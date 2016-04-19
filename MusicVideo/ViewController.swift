//
//  ViewController.swift
//  MusicVideo
//
//  Created by Christos Baloukas on 14/4/16.
//  Copyright © 2016 Christos Baloukas. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var videos = [Videos]()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //Call API
        let api = APIManager()
        api.loadData("https://itunes.apple.com/us/rss/topmusicvideos/limit=10/json", completion: didLoadData)
    }

    func didLoadData(videos: [Videos]) {
        
        self.videos = videos
        
        for item in videos {
            print("name = \(item.vName)")
        }
        
        // Another way to enumerate if we also need the index
        for (index, item) in videos.enumerate() {
            print("\(index) name = \(item.vName)")
        }
        
    }


}

