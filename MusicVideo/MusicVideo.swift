//
//  MusicVideo.swift
//  MusicVideo
//
//  Created by Christos Baloukas on 16/4/16.
//  Copyright © 2016 Christos Baloukas. All rights reserved.
//

import Foundation

class Videos {
    
    // Data Encapsulation
    
    private(set) var vName: String
    private(set) var vImageURL: String
    private(set) var vVideoURL: String
    
    init(data: JSONDictionary) {
        
        // Video name
        if let name = data["im:name"] as? JSONDictionary {
            vName = name["label"] as! String
        }
        else {
            vName = ""
        }
        
        if let img = data["im:image"] as? JSONArray,
            image = img[2] as? JSONDictionary,
            immage = image["label"] as? String {
                vImageURL = immage.stringByReplacingOccurrencesOfString("100x100", withString: "600x600")
        }
        else {
            vImageURL = ""
        }
        
        if let video = data["link"] as? JSONArray,
            vUrl = video[1] as? JSONDictionary,
            vHref = vUrl["attributes"] as? JSONDictionary,
            vVideoUrl = vHref["href"] as? String {
                vVideoURL = vVideoUrl
        }
        else {
            vVideoURL = ""
        }
    }
}