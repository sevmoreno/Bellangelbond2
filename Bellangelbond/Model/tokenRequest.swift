//
//  tokenRequest.swift
//  Bellangelbond
//
//  Created by Juan Moreno on 8/23/19.
//  Copyright © 2019 Juan Moreno. All rights reserved.
//

import Foundation

struct tokeRequest {
    
    var header: header
    var claims: claims
}

struct header {
    var alg: String = "ES256"
    var kid: String = "2ZL2JTUB26"
}

struct claims
    {
       var iss: String = "5766G78FC9"
       var iat: Int =  1437179036
       var exp: Int = 1493298100
}
