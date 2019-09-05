//
//  ViewController.swift
//  Bellangelbond
//
//  Created by Juan Moreno on 8/15/19.
//  Copyright © 2019 Juan Moreno. All rights reserved.
//

import UIKit
import Firebase
import SwiftJWT
import StoreKit


class HomeViewController: UIViewController {
    
    @IBOutlet weak var tabla: UITableView!
    
    let controller = SKCloudServiceController()
    let developerToken =  advengers.shared.token

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
      DispatchQueue.main.async {
        SKCloudServiceController.requestAuthorization { (status: SKCloudServiceAuthorizationStatus) in
            
            switch status {
                
            case .authorized:
                
                print("Autorizado")
                
            case .denied:
                
                print("Denegado")
                
            case .notDetermined:
                print("Denegado")
                
            case .restricted:
                print("Denegado")
                
            @unknown default:
                print("No se sabe")
            }
        }
        }
       /*
        let teamId = "5766G78FC9"
        let keyId = "2ZL2JTUB26"
        let keyFileUrl = Bundle.main.url(forResource: "AuthKey_2ZL2JTUB27", withExtension: "p8")
        
        struct MyClaims: Claims {
            let iss: String
            let iat: Date?
            let exp: Date?
        }
        
        let myHeader = Header(kid: keyId)
        let myClaims = MyClaims(iss: teamId, iat: Date(), exp: Date() +  24 * 60 * 60)
        var myJWT = SwiftJWT.JWT(header: myHeader, claims: myClaims)
        
        let token = try! myJWT.sign(using: .es256(privateKey: try! String(contentsOf: keyFileUrl!).data(using: .utf8)!))
        
        print("Este es el token")
        print (token)
 */
        
        advengers.shared.token = "eyJ0eXAiOiJKV1QiLCJhbGciOiJFUzI1NiIsImtpZCI6IjJaTDJKVFVCMjYifQ.eyJpc3MiOiI1NzY2Rzc4RkM5IiwiaWF0IjoxNTY3NTUwNzkyLjY4MTE3ODEsImV4cCI6MTU2NzYzNzE5Mi42ODExNzl9.ngPxIDR_n-MNexgiEb_MlQEz9K3kpeSxEnqmIZxYeUPHsMuoIr6ANfGt4lO4EEbiodi4bMMWzmcaNyhQXDOcWw"
        
       
        controller.requestUserToken(forDeveloperToken: developerToken) { userToken, error in
            // Use this value for recommendation requests.
            print("Este es el user token")
            print(userToken)
            print(error.debugDescription)
        }

        
        DispatchQueue.main.async {
        SKCloudServiceController().requestStorefrontCountryCode { countryCode, error in
            // Use the value in countryCode for subsequent API requests
            print("Codigo de Pais")
            print(countryCode)
            print(error.debugDescription)
        }
        
        }
       
  
    
        
        tabla.dataSource = self
        tabla.delegate = self
        
        // Duumy antes de conetar infomracion de USuario
        advengers.shared.user.paths.removeAll()
        advengers.shared.user.paths.append("pathInicio")
    
        
        
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
