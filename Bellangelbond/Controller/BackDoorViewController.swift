//
//  BackDoorViewController.swift
//  Bellangelbond
//
//  Created by Juan Moreno on 8/23/19.
//  Copyright © 2019 Juan Moreno. All rights reserved.
//

import UIKit
import SwiftJWT


class BackDoorViewController: UIViewController {
    
    let dictionario: NSDictionary = [
        "newsDate": "2019&08&12",
        "url" : "Temporario URL",
        "thumbURL" : "rivers.jpg",
        "title" : "42",
        "subtitle" : "someValue",
        "bodyText" : ""]
    
    struct MyClaims: Claims {
        let iss: String
        let iat: Date
        let exp: Date
    }
    
    struct MyClaims2: Claims {
        let iss: String
        let sub: String
        let exp: Date
        let admin: Bool
    }
    let myClaims2 = MyClaims2(iss: "Kitura", sub: "John", exp: Date(timeIntervalSinceNow: 3600), admin: true)
   
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("Este es el valor de iat")
        let unixTimestamp = UInt(NSDate().timeIntervalSince1970*1000)
        print(unixTimestamp)
     //   let myHeader = Header(kid: "2ZL2JTUB26")
        let myHeader = Header(kid: "KeyID1")
        /*
        
        let myClaims = MyClaims(iss: "5766G78FC9",  iat: Date(), exp: Date (timeIntervalSinceNow: 3600))
        var myJWT = JWT(header: myHeader, claims: myClaims)
        
       if  let urlPath = Bundle.main.url(forResource: "AuthKey_2ZL2JTUB27", withExtension: "p8")
        
       {
        print("Hasta aca llegamos A")
        let privateKey: Data = try! Data(contentsOf: urlPath, options: .alwaysMapped)
        print("Decodifico Este:")
        print (String(decoding: privateKey, as: UTF8.self))
        let jwtSigner = JWTSigner.rs256(privateKey: privateKey)
        let signedJWT = try! myJWT.sign(using: jwtSigner)
        
        }
 
 */
        
        
        // SECOND PART
        if  let urlPath2 = Bundle.main.url(forResource: "privateKey", withExtension: "key")
            
        {
        var myJWT2 = JWT(header: myHeader, claims: myClaims2)
        //let privateKeyPath2 = URL(fileURLWithPath: urlPath2)
        let privateKey2: Data = try! Data(contentsOf: urlPath2, options: .alwaysMapped)
        //let publicKeyPath2 = URL(fileURLWithPath: urlPath2)
        let publicKey2: Data = try! Data(contentsOf: urlPath2, options: .alwaysMapped)
        
        let jwtSigner2 = JWTSigner.rs256(privateKey: privateKey2)
        
        let signedJWT = try! myJWT2.sign(using: jwtSigner2)
        
        }
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
