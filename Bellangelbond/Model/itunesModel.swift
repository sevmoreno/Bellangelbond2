//
//  itunesModel.swift
//  Bellangelbond
//
//  Created by Juan Moreno on 8/23/19.
//  Copyright © 2019 Juan Moreno. All rights reserved.
//

import Foundation


struct itunesModel {
    
    var wrapperType: String = "track"
    var kind: String = "song"
    var artistId: Int = 909253
    var collectionId: Int = 120954021
    var trackId: Int = 120954025
    var artistName: String = "Jack Johnson"
    var collectionName: String = "Sing-a-Longs and Lullabies for the Film Curious George"
    var trackName: String = "Upside Down"
    var collectionCensoredName: String = "Sing-a-Longs and Lullabies for the Film Curious George"
    var trackCensoredName: String = "Upside Down"
    var artistViewUrl: String = "https://itunes.apple.com/WebObjects/MZStore.woa/wa/viewArtist?id=909253"
    var collectionViewUrl: String = "https://itunes.apple.com/WebObjects/MZStore.woa/wa/viewAlbum?i=120954025&id=120954021&s=143441"
    var trackViewUrl: String = "https://itunes.apple.com/WebObjects/MZStore.woa/wa/viewAlbum?i=120954025&id=120954021&s=143441"
    var previewUrl: String = "http://a1099.itunes.apple.com/r10/Music/f9/54/43/mzi.gqvqlvcq.aac.p.m4p"
    var artworkUrl60: String = "http://a1.itunes.apple.com/r10/Music/3b/6a/33/mzi.qzdqwsel.60x60-50.jpg"
    var artworkUrl100: String = "http://a1.itunes.apple.com/r10/Music/3b/6a/33/mzi.qzdqwsel.100x100-75.jpg"
    var collectionPrice: Float = 10.99
    var trackPrice: Float = 0.99
    var collectionExplicitness: String = "notExplicit"
    var trackExplicitness: String = "notExplicit"
    var discCount: Int = 1
    var discNumber: Int = 1
    var trackCount: Int = 14
    var trackNumber: Int = 1
    var trackTimeMillis: Int = 210743
    var country: String = "USA"
    var currency: String = "USD"
    var primaryGenreName: String = "Rock"
}
