//
//  TrandingCell.swift
//  videoPlayerDemo
//
//  Created by Welton Dornelas Magalhães on 11/01/2018.
//  Copyright © 2018 Welton Dornelas Magalhães. All rights reserved.
//

import UIKit

class TrandingCell: FeedCell {
    
    override func fetchVideos() {
        ApiServices.sharedInstance.fetchTrendingFeed { (videos) in
            self.videos = videos
            self.collectionView.reloadData()
        }
    }
    
}
