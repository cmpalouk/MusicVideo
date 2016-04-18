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
    private(set) var vRights: String
    private(set) var vPrice: String
    private(set) var vImageURL: String
    private(set) var vArtist: String
    private(set) var vVideoURL: String
    private(set) var vImid: String
    private(set) var vGenre: String
    private(set) var vLinkToiTunes: String
    private(set) var vReleaseDate: String
    
    init(data: JSONDictionary) {
        
        // Video name
        if let name = data["im:name"] as? JSONDictionary {
            vName = name["label"] as! String
        }
        else {
            vName = ""
        }
        
        // The studio name
        if let rights = data["rights"] as? JSONDictionary {
            vRights = rights["label"] as! String
        }
        else {
            vRights = ""
        }
        
        // Video price
        if let price = data["im:price"] as? JSONDictionary {
            vPrice = price["label"] as! String
        }
        else {
            vPrice = ""
        }
        
        // Video Image
        if let img = data["im:image"] as? JSONArray,
            image = img[2] as? JSONDictionary,
            immage = image["label"] as? String {
                vImageURL = immage.stringByReplacingOccurrencesOfString("100x100", withString: "600x600")
        }
        else {
            vImageURL = ""
        }
        
        // The artist name
        if let artist = data["im:artist"] as? JSONDictionary {
            vArtist = artist["label"] as! String
        }
        else {
            vArtist = ""
        }
        
        // Video URL
        if let video = data["link"] as? JSONArray,
            vUrl = video[1] as? JSONDictionary,
            vHref = vUrl["attributes"] as? JSONDictionary,
            vVideoUrl = vHref["href"] as? String {
            vVideoURL = vVideoUrl
        }
        else {
            vVideoURL = ""
        }
        
        // The Artist ID for iTunes Search API
        if let id = data["id"] as? JSONDictionary,
            attributes = id["attributes"] as? JSONDictionary {
            vImid = attributes["im:id"] as! String
        }
        else {
            vImid = ""
        }
        
        // Video genre
        if let category = data["category"] as? JSONDictionary,
            attributes = category["attributes"] as? JSONDictionary {
            vGenre = attributes["term"] as! String
        }
        else {
            vGenre = ""
        }
        
        // The link to itunes page of the video
        if let link = data["id"] as? JSONDictionary {
            vLinkToiTunes = link["label"] as! String
        }
        else {
            vLinkToiTunes = ""
        }
        
        // The release date
        if let releaseDate = data["im:releaseDate"] as? JSONDictionary,
            attributes = releaseDate["attributes"] as? JSONDictionary {
            vReleaseDate = attributes["label"] as! String
        }
        else {
            vReleaseDate = ""
        }
        
        print(vName)
        print(vRights)
        print(vPrice)
        print(vImageURL)
        print(vArtist)
        print(vVideoURL)
        print(vImid)
        print(vGenre)
        print(vLinkToiTunes)
        print(vReleaseDate)
    }
}