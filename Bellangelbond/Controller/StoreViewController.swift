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

        // Do any additional setup after loading the view.
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
