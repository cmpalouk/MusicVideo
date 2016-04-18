//
//  APIManager.swift
//  MusicVideo
//
//  Created by Christos Baloukas on 14/4/16.
//  Copyright © 2016 Christos Baloukas. All rights reserved.
//

import Foundation

class APIManager {
    
    func loadData(urlString:String, completion: (result:String) -> Void) {
        
        let config = NSURLSessionConfiguration.ephemeralSessionConfiguration()
        
        let session = NSURLSession(configuration: config)
        
//        let session = NSURLSession.sharedSession()
        let url = NSURL(string: urlString)!
        
        let task = session.dataTaskWithURL(url) { (data, response, error) in
            
            if error != nil {
                dispatch_async(dispatch_get_main_queue()) {
                    completion(result: (error!.localizedDescription))
                }
            } else {
                
                //Added for JSONSerialization
                //print(data)
                do {
                    /* .AllowFragments - top level object is not Array or Dictionary.
                    Any type of string or value
                    NSJSONSerialization requires the Do / Try / Catch
                    Converts the NSDATA into a JSON Object and cast it to a Dictionary */
                    
                    if let json = try NSJSONSerialization.JSONObjectWithData(data!, options: .AllowFragments) as? JSONDictionary {
                        
                        print(json)
                        let feed = json["feed"] as! JSONDictionary
                        let entry = feed["entry"] as! JSONArray
                        let myVideo = Videos(data: entry[0] as! JSONDictionary)
                        
                        
                        let priority = DISPATCH_QUEUE_PRIORITY_HIGH
                        dispatch_async(dispatch_get_global_queue(priority, 0), {
                            dispatch_async(dispatch_get_main_queue(), {
                                completion(result: "JSON Serialization Successful")
                            })
                        })
                    }
                } catch {
                    dispatch_async(dispatch_get_main_queue(), { 
                        completion(result: "error in JSON Serialization")
                    })
                }
            }
        }
        task.resume()
    }
}