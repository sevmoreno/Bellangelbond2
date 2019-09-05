



import UIKit
import CoreData
import MapKit
import Firebase


class advengers {
    
    // --- The Singleton
    
    let usersStatusRef = Database.database().reference(withPath: "online")
    static let shared = advengers ()
    
    // -------------------- NEWS TOOOLS -------------------
    let lastNewsRef = Database.database().reference().child ("last_news")
   // var newsfeeds = [newFeed (newsDate: "", url: "", thumbURL: "", title: "", subtitle: "", bodyText: "")]
    
    var newfeeds = [newFeed]()


    let storageRef = Storage.storage().reference()
    
    let pathsRef = Database.database().reference().child ("Paths")
    
    let mediaRef = Database.database().reference().child ("Media")
    
    var user = userAcces ()
    
    
    var mediaPlayList = [mediaBModel] ()
    
    
    var token: String = ""
    

    private init() {
        
    }
    
    // Singleton POWER
    
    
   
}

