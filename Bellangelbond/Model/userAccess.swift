//
//  userAccess.swift
//  Bellangelbond
//
//  Created by Juan Moreno on 8/30/19.
//  Copyright © 2019 Juan Moreno. All rights reserved.
//

import Foundation

struct userAcces: Codable {
    
    var username: String = ""
    var userEmail: String = ""
    var userToken: String = ""
    var paths: [String] = [""]
    var mediaRaw: [String] = [""]
    var mediaJubal: [MediaJubal] = [MediaJubal(codigokeysong: "", mediaBts: [mediaBeets(reaction: 0.0, time: 0.0)], generalLiknes: 0.0)]
    
}


struct MediaJubal: Codable {
    
    var codigokeysong: String = ""
    
    var mediaBts: [mediaBeets] = [mediaBeets(reaction: 0.0, time: 0.0)]
    
    var generalLiknes: Double = 0.0
    
    
}

struct mediaBeets: Codable {
    
    var reaction: Double = 0.0
    var time: Double = 0.0
    
}

