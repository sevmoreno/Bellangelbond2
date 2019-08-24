//
//  BackDoorViewController.swift
//  Bellangelbond
//
//  Created by Juan Moreno on 8/23/19.
//  Copyright © 2019 Juan Moreno. All rights reserved.
//

import UIKit
//import SwiftJWT

class BackDoorViewController: UIViewController {
    
    let dictionario: NSDictionary = [
        "newsDate": "2019&08&12",
        "url" : "Temporario URL",
        "thumbURL" : "rivers.jpg",
        "title" : "42",
        "subtitle" : "someValue",
        "bodyText" : ""]
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        
        // Dummy Data
        /*
         
         let _: NSDictionary = [
         "newsDate": "2019&08&12",
         "url" : "Temporario URL",
         "thumbURL" : "rivers.jpg",
         "title" : "42",
         "subtitle" : "someValue",
         "bodyText" : ""]
         
         
         let formatter = DateFormatter()
         //2016-12-08 03:37:22 +0000
         formatter.dateFormat = "yyyy&MM&dd&HH:mm"
         let now = Date()
         let dateString = formatter.string(from:now)
         
         let groceryItem = newFeed(newsDate: "",url: "Temporario URL", thumbURL: "Temporaio thumb", title: "Temorario Title", subtitle: "Temporario subtitle", bodyText: "temporario body")
         
         // 3
         let groceryItemRef = advengers.shared.lastNewsRef.child(dateString)
         
         // 4
         groceryItemRef.setValue(dictionario)
         
         //   advengers.shared.lastNewsRef.setValue(dictionario)
         
         
         
         
         // Dummy Uploaded Store
         
         // let storageRef = Storage.storage().reference()
         
         let riversRef = advengers.shared.storageRef.child("image/rivers.jpg")
         let dataimage = (UIImage(named: "casas")?.pngData())!
         let uploadTask = riversRef.putData(dataimage, metadata: nil) { (metadata, error) in
         guard let metadata = metadata else { return }
         
         // let downloadURL = metadata.downloadURL
         // ...
         }
         
         
         let dataimage2 = (UIImage(named: "discover")?.pngData())!
         let riversRef2 = advengers.shared.storageRef.child("image/discover.jpg")
         let uploadTask2 = riversRef2.putData(dataimage2, metadata: nil) { (metadata, error) in
         guard let metadata = metadata else { return }
         
         // let downloadURL = metadata.downloadURL
         // ...
         }
         
         
         */
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
