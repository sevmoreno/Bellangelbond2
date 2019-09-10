



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
    
    
    var token: String = "eyJ0eXAiOiJKV1QiLCJhbGciOiJFUzI1NiIsImtpZCI6IjhMUTdMQUpMRlkifQ.eyJpc3MiOiI1NzY2Rzc4RkM5IiwiaWF0IjoxNTY3ODA2NTcxLjYzMjM0NSwiZXhwIjoxNTY3ODkyOTcxLjYzMjM0NX0.44F-mTZWq75TUydML66uQpKGtPBLKJ2DXaREod0EqvSGWFEPZxlZBt0ObuMeBPVTQ-y1VsoApUmmoc2z_Pf5hg"
    

    private init() {
        
    }
    
    // Singleton POWER
    
    
   
}

