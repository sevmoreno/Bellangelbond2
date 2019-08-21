//
//  ViewController.swift
//  Bellangelbond
//
//  Created by Juan Moreno on 8/15/19.
//  Copyright © 2019 Juan Moreno. All rights reserved.
//

import UIKit
import Firebase



class HomeViewController: UIViewController {
    
    @IBOutlet weak var tabla: UITableView!
    
    
    let rootrefNews = Database.database().reference(withPath: "last_news")

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tabla.dataSource = self
        tabla.delegate = self
        
        
        // Dummy Data
        
        let dictionario: NSDictionary = [
            "url" : "Temporario URL",
            "helloString" : "Hello, World!",
            "magicNumber" : 42,
            "aValue" : "someValue"
        ]
        
        let formatter = DateFormatter()
        //2016-12-08 03:37:22 +0000
        formatter.dateFormat = "yyyy&MM&dd"
        let now = Date()
        let dateString = formatter.string(from:now)
        
        let groceryItem = newFeed(url: "Temporario URL", thumbURL: "Temporaio thumb", title: "Temorario Title", subtitle: "Temporario subtitle", bodyText: "temporario body")
        
        // 3
        let groceryItemRef = self.rootrefNews.child(dateString)
                                        
        // 4
        groceryItemRef.setValue(dictionario)
        
        
        // Dummy Uploaded Store
        
        let storageRef = Storage.storage().reference()
        let riversRef = storageRef.child("image/rivers.jpg")
        let dataimage = (UIImage(named: "casas")?.pngData())!
        let uploadTask = riversRef.putData(dataimage, metadata: nil) { (metadata, error) in
            guard let metadata = metadata else { return }
            
           // let downloadURL = metadata.downloadURL
            // ...
        }
        
        
        let dataimage2 = (UIImage(named: "discover")?.pngData())!
        let riversRef2 = storageRef.child("image/discover.jpg")
        let uploadTask2 = riversRef2.putData(dataimage2, metadata: nil) { (metadata, error) in
            guard let metadata = metadata else { return }
            
            // let downloadURL = metadata.downloadURL
            // ...
        }

        
        
        
        }

    }
    




extension HomeViewController: UITableViewDelegate {
    
}


extension HomeViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       
        let cell = tableView.dequeueReusableCell(withIdentifier: "please", for: indexPath)
        
        if let titleLable = cell.viewWithTag(301) as? UILabel
        {
            titleLable.text = "Hay Content"
        }
        
        if let contentImage = cell.viewWithTag(303) as? UIImageView
        {
           
            let storageRef = Storage.storage().reference()
            let riversRef = storageRef.child("image/discover.jpg")
        
            let uploadTask = riversRef.getData(maxSize: 10 * 1024 * 1024, completion: { (data, error) in
               // nothing
                if data != nil {
            contentImage.image = UIImage(data: data!)
                } else {
                    print("Error de bajada")
                    print(error.debugDescription)
                    
                }
                
            })
            
           
            
            
        }
        
        return cell
        
    }
    
    
    
}
