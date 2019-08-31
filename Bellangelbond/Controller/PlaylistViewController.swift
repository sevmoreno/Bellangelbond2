//
//  PlaylistViewController.swift
//  Bellangelbond
//
//  Created by Juan Moreno on 8/20/19.
//  Copyright © 2019 Juan Moreno. All rights reserved.
//

import UIKit

class PlaylistViewController: UIViewController {

    @IBOutlet weak var tablaPlayList: UITableView!
    
    var mediaListkey = [String] ()

    var mediaToSend = mediaBModel ()
    var mediaToSendIndex = 4
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tablaPlayList.dataSource = self
        tablaPlayList.delegate = self
        advengers.shared.mediaPlayList.removeAll()
        print ("Cantindad del playlist")
        print(mediaListkey.count)
        
        advengers.shared.mediaRef.observe(.value, with: { snapshot in
            
            
            if snapshot.childrenCount > 0 {
                
                print("CONTO CHILDERSS???")
                if let noticia = snapshot.value as? NSDictionary {
                    for canciones in self.mediaListkey {
                var elemento2 = noticia.value(forKey: canciones)
                        
                if elemento2 != nil {
                    let elemento3 = elemento2 as! String
                    print("ELEMENTO DEL PLAYLIST")
                    print(elemento3)
                            
                    let decoder = JSONDecoder ()
                    let dataP = elemento3.data(using: .utf8)!
                    let contendioDelPath = try! decoder.decode(mediaBModel.self, from: dataP)
                    advengers.shared.mediaPlayList.append(contendioDelPath)
                        //    self.pathsDelUsuario.append(contendioDelPath)
                        //    self.discoverMusic.reloadData()
                    self.tablaPlayList.reloadData()
                        }
                        
                    }
                    
                    
                }
            }
            
        })

    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ToSong" {
            
                let controller = segue.destination as! PlayerMusciViewController
                controller.mediaToPlay = mediaToSend
                controller.indexToPlayIndex = mediaToSendIndex
            
        }
    }

 
}

extension PlaylistViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return advengers.shared.mediaPlayList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "playlistCell", for: indexPath)
        
        if indexPath.item >= 0 {
            
            if let imagen = cell.viewWithTag(501) as? UIImageView
                
            {
                imagen.image = UIImage(named: "fondo")
                
            }
            
            if let titulo = cell.viewWithTag(502) as? UILabel
                
            {
                titulo.text = advengers.shared.mediaPlayList[indexPath.item].trackName
                
            }
            
            if let subTitulo = cell.viewWithTag(503) as? UILabel
                
            {
                subTitulo.text = advengers.shared.mediaPlayList[indexPath.item].artistName
                
            }
            
            
        }
        
        

        
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("Seleccionada")
        mediaToSend = advengers.shared.mediaPlayList[indexPath.item]
        self.performSegue(withIdentifier: "ToSong", sender: self)
    }
    
    
}

extension PlaylistViewController: UITableViewDelegate {
    
}
