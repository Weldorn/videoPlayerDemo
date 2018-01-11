//
//  APIServices.swift
//  videoPlayerDemo
//
//  Created by Welton Dornelas Magalhães on 11/01/2018.
//  Copyright © 2018 Welton Dornelas Magalhães. All rights reserved.
//

import UIKit

class ApiServices: NSObject {
    
    static let sharedInstance = ApiServices()
    
    func fetchVideos(completion: @escaping ([Video]) -> ())  {
        let url = URL(string: "https://s3-us-west-2.amazonaws.com/youtubeassets/home.json")
        URLSession.shared.dataTask(with: url!) { (data, response, error) in
            
            if error != nil {
                print(error!)
                return
            }
            do {
                let json = try JSONSerialization.jsonObject(with: data!, options: .mutableContainers)
                
                var videos = [Video]()
                
                for dictionary in json as! [[String: AnyObject]] {
                    let video = Video()
                    video.title = dictionary["title"] as? String
                    video.thumbNailImageName = dictionary["thumbnail_image_name"] as? String
                    video.numberOfViews = dictionary["number_of_views"] as? NSNumber
                    
                    let channelDictiorany = dictionary["channel"] as! [String: AnyObject]
                    
                    let channel = Channel()
                    channel.name = channelDictiorany["name"] as? String
                    channel.profileImageName = channelDictiorany["profile_image_name"] as? String
                    
                    video.channel = channel
                    
                    videos.append(video)
                    
                }
                DispatchQueue.main.async {
                    completion(videos)
                }
            } catch let jsonError {
                print(jsonError)
              }
            
            }.resume()
    }
}
