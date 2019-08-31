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
    
    var pathsDelUsuario = [pathDiscover] ()
    
    var arraytoSend =  [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        discoverMusic.delegate = self
        discoverMusic.dataSource = self
        discoverMusic.allowsSelection = true

        // Dependiendo de bajar la data de los paths de FIREBASE ----------- ASUMIENDO QUE NO HAY COREDATA
        
        advengers.shared.pathsRef.observe(.value, with: { snapshot in
            
            print("CONTO \(snapshot.childrenCount) Childrens")
            
            if snapshot.childrenCount > 0 {
                
                print("CONTO CHILDERSS???")
                if let noticia = snapshot.value as? NSDictionary {
               
            
                    for pathnombre in advengers.shared.user.paths {
                        print("Esto es path nombre")
                        print(advengers.shared.user.paths.count)
                        var elemento2 = noticia.value(forKey: pathnombre)
                        
                        if elemento2 != nil {
                        let elemento3 = elemento2 as! String
   
                        let decoder = JSONDecoder ()
                        let dataP = elemento3.data(using: .utf8)!
                        let contendioDelPath = try! decoder.decode(pathDiscover.self, from: dataP)
                        print("FINALLLL")
                        print (contendioDelPath.pathSubtitle)
                        //let temporarioPath = pathDiscover ()
                        self.pathsDelUsuario.append(contendioDelPath)
                        self.discoverMusic.reloadData()
                            
                        }
                        
                    }

        
            }
        }
        
    })
        
        self.discoverMusic.reloadData()
    
        // ----------------------------------------------------

}
}

extension DiscoverMusicViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pathsDelUsuario.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "musicToDiscover", for: indexPath)
   
        if indexPath.item >= 0 {
            
        if let imagen = cell.viewWithTag(400) as? UIImageView
        
        {
            imagen.image = UIImage(named: "fondo")
            
        }
        
        if let titulo = cell.viewWithTag(402) as? UILabel
            
        {
            titulo.text = pathsDelUsuario[indexPath.item].pathName
            
        }
        
        if let subTitulo = cell.viewWithTag(403) as? UILabel
            
        {
            subTitulo.text = pathsDelUsuario[indexPath.item].pathSubtitle
            
        }
        
            
        }
        
        

        
        return cell
    }
    
    /*
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        
        print("sellecionado")
        self.performSegue(withIdentifier: "toPlayList", sender: self)
    }
 */
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("comooon")
        arraytoSend = pathsDelUsuario[indexPath.item].listaDeMedia
        self.performSegue(withIdentifier: "toPlayList", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "toPlayList" {
           
                let controller = segue.destination as! PlaylistViewController
                controller.mediaListkey = arraytoSend
            
        }
    }
    
}


extension DiscoverMusicViewController: UITableViewDelegate
{
    
}
