//
//  PlayerMusciViewController.swift
//  Bellangelbond
//
//  Created by Juan Moreno on 8/26/19.
//  Copyright © 2019 Juan Moreno. All rights reserved.
//

import UIKit
import AVKit
import Foundation


class PlayerMusciViewController: UIViewController {
    
 

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let path = Bundle.main.url(forResource: "APM", withExtension: "wav")!
        
            
            print("Encontro el path")
           // let url2 = URL (string: path!)!
            let musicplayer = AVPlayer (url: path)
            
        
            
            let playerViewController = AVPlayerViewController()
            playerViewController.player = musicplayer
            
            present(playerViewController, animated: true) {
                musicplayer.play()
            }

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
