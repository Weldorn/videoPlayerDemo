//
//  Video.swift
//  videoPlayerDemo
//
//  Created by Welton Dornelas Magalhães on 04/01/2018.
//  Copyright © 2018 Welton Dornelas Magalhães. All rights reserved.
//

import UIKit

class Video: NSObject {
    var thumbNailImageName: String?
    var title: String?
    var numberOfViews: NSNumber?
    var uploadDate: NSDate?
    var channel: Channel?
}

class Channel: NSObject {
    var name: String?
    var profileImageName: String?
}
