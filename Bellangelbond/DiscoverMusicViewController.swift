//
//  DiscoverMusicViewController.swift
//  Bellangelbond
//
//  Created by Juan Moreno on 8/16/19.
//  Copyright © 2019 Juan Moreno. All rights reserved.
//

import UIKit

class DiscoverMusicViewController: UIViewController {

    @IBOutlet weak var discoverMusic: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        discoverMusic.delegate = self
        discoverMusic.dataSource = self
        
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

extension DiscoverMusicViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "musicToDiscover", for: indexPath)
        
        return cell
    }
    
    
}


extension DiscoverMusicViewController: UITableViewDelegate
{
    
}
