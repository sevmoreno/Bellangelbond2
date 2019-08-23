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
    

  

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tabla.dataSource = self
        tabla.delegate = self
        
        let dictionario: NSDictionary = [
            "newsDate": "2019&08&12",
            "url" : "Temporario URL",
            "thumbURL" : "Hello, World!",
            "title" : "42",
            "subtitle" : "someValue",
            "bodyText" : ""]
        
        
        
        advengers.shared.lastNewsRef.observe(.value, with: { snapshot in
     
            if snapshot.childrenCount > 0 {

                if let noticia = snapshot.value as? NSDictionary {
 
                    for elemento in noticia.allValues {
                        
                        if let individual = elemento as? NSDictionary {
                            
                            let elementoNoticia = newFeed(newsDate: individual.value(forKey: "newsDate") as? String ?? "",url: individual.value(forKey: "url") as? String ?? "", thumbURL: individual.value(forKey: "thumbURL") as? String ?? "", title: individual.value(forKey: "title") as? String ?? "", subtitle: individual.value(forKey: "subtitle") as? String ?? "", bodyText: individual.value(forKey: "bodyText") as? String ?? "")
                            
                            advengers.shared.newfeeds.append(elementoNoticia)
                            
                            
                        }
                        self.tabla.reloadData()
                    }
                    
                    
                }
                
                /*
                for news in (snapshot.children.allObjects as! [String: AnyObject ]) {
                    
                    
                   //let objetNews = news.value as? [String: AnyObject]
                   // let tituloNews = objetNews?[""]
                   // print("Encontro esto \(news.codeDate)")
                }
            
                 */
           
                
            }

        })
        
        // Dummy Data
      
        let _: NSDictionary = [
            "newsDate": "2019&08&12",
            "url" : "Temporario URL",
            "thumbURL" : "Hello, World!",
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

        
        
        
        }

    }
    




extension HomeViewController: UITableViewDelegate {
    
}


extension HomeViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return advengers.shared.newfeeds.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       
        let cell = tableView.dequeueReusableCell(withIdentifier: "please", for: indexPath)
        
        if let titleLable = cell.viewWithTag(301) as? UILabel
        {
            titleLable.text = advengers.shared.newfeeds[indexPath.row].title
        }
        
        if let subTitleLable = cell.viewWithTag(302) as? UILabel
        {
            subTitleLable.text = advengers.shared.newfeeds[indexPath.row].subtitle
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
