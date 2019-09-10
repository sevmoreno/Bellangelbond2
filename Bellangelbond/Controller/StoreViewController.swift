//
//  StoreViewController.swift
//  Bellangelbond
//
//  Created by Juan Moreno on 8/16/19.
//  Copyright © 2019 Juan Moreno. All rights reserved.
//

import UIKit

class StoreViewController: UIViewController {

    @IBOutlet weak var store: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let searchTerm  = "workouts"
        let countryCode = "us"
        
        var components = URLComponents()
        components.scheme = "https"
        components.host   = "api.music.apple.com"
        components.path   = "/v1/catalog/\(countryCode)/search"
        
        components.queryItems = [
            URLQueryItem(name: "term", value: searchTerm),
            URLQueryItem(name: "limit", value: "25"),
            URLQueryItem(name: "types", value: "playlists"),
        ]
        
        let url = components.url

       
        
        var request = URLRequest(url: url!)
        request.setValue("Bearer \(advengers.shared.token)", forHTTPHeaderField: "Authorization")
        request.setValue(advengers.shared.user.userToken, forHTTPHeaderField: "Music-User-Token")
        
        
        let session = URLSession.shared
        
        let task = session.dataTask(with: request) { data, response, error in
            
            guard let data = data else {
                return
            }
            
            do {
                print("Data del APi")
                print(data)
                let json = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any]
            }
            catch {
            }
            
        }
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    @IBAction func backdoorButton(_ sender: Any) {
        
        performSegue(withIdentifier: "backDoor", sender: self)
    }
    
}




extension StoreViewController:  UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 7
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "selecionStore", for: indexPath)
        
        return cell
    }
    
 
    
    
}

extension StoreViewController: UICollectionViewDelegate {
    
}
