//
//  ViewController.swift
//  Bellangelbond
//
//  Created by Juan Moreno on 8/15/19.
//  Copyright © 2019 Juan Moreno. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var tabla: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tabla.dataSource = self
        tabla.delegate = self

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

}

extension ViewController: UITableViewDelegate {
    
}


extension ViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       
        let cell = tableView.dequeueReusableCell(withIdentifier: "please", for: indexPath)
        
        
        
        return cell
        
    }
    
    
    
}
