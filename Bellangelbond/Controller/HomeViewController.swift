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
        
    
        
        
        advengers.shared.lastNewsRef.observe(.value, with: { snapshot in
     
            if snapshot.childrenCount > 0 {

                if let noticia = snapshot.value as? NSDictionary {
 
                    for elemento in noticia.allValues {
                        
                        // advengers.shared.newfeeds.removeAll()
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
            let riversRef = storageRef.child("image/" + advengers.shared.newfeeds[indexPath.row].thumbURL )
            print("ESTO ES EL NOMBRE DE IMAGEN EL EL ARRAY")
            print(advengers.shared.newfeeds[indexPath.row].thumbURL)
            
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
