//
//  BackDoorViewController.swift
//  Bellangelbond
//
//  Created by Juan Moreno on 8/23/19.
//  Copyright © 2019 Juan Moreno. All rights reserved.
//

import UIKit
import SwiftJWT
import Firebase


class BackDoorViewController: UIViewController {
    
  
    var listOfSong = ["Andrei", "Silviu", "Claudiu"]
    
    
    let dictionario: NSDictionary = [
        "newsDate": "2019&08&12",
        "url" : "Temporario URL",
        "thumbURL" : "rivers.jpg",
        "title" : "42",
        "subtitle" : "someValue",
        "bodyText" : ""]
    
    struct MyClaims: Claims {
        let iss: String
        let iat: Date
        let exp: Date
    }
    
    struct MyClaims2: Claims {
        let iss: String
        let sub: String
        let exp: Date
        let admin: Bool
    }
    let myClaims2 = MyClaims2(iss: "Kitura", sub: "John", exp: Date(timeIntervalSinceNow: 3600), admin: true)
   
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        //============================= NW VERSIO OF JWT WOOORKING
        
       
       /*
        let teamId = "5766G78FC9"
        let keyId = "8LQ7LAJLFY"
        let keyFileUrl = Bundle.main.url(forResource: "AuthKey_8LQ7LAJLFY", withExtension: "p8")
        
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
        
        
        
        //  ========================= TRYING TO CREAT A JWT TO SIGN IN APP MUSIC ================
        
        /*
        print("Este es el valor de iat")
        let unixTimestamp = UInt(NSDate().timeIntervalSince1970*1000)
        print(unixTimestamp)

        let myHeader = Header(kid: "KeyID1")
        

        if  let urlPath2 = Bundle.main.url(forResource: "privateKey", withExtension: "key")
            
        {
        var myJWT2 = JWT(header: myHeader, claims: myClaims2)

        let privateKey2: Data = try! Data(contentsOf: urlPath2, options: .alwaysMapped)

        let publicKey2: Data = try! Data(contentsOf: urlPath2, options: .alwaysMapped)
        
        let jwtSigner2 = JWTSigner.rs256(privateKey: privateKey2)
        
        let signedJWT = try! myJWT2.sign(using: jwtSigner2)
        
        }
        // Do any additional setup after loading the view.
        
        */
        
        // ============================  Dummy Data NOTICIAS =====================================
        /*
         
         let _: NSDictionary = [
         "newsDate": "2019&08&12",
         "url" : "Temporario URL",
         "thumbURL" : "rivers.jpg",
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
         
         
         */
        
        
        
        // ============================  Dummy Data PAHT AND MUSCI =====================================
   
        struct formatoA: Codable {
            
            var urlThumb: String
            var pathSubtitle : String
            var listaDeMedia :[String]
            var urlImage: String
            var pathName: String
            var idPath: String
        }
        
         let _: NSDictionary = [
         "newsDate": "2019&08&12",
         "url" : "Temporario URL",
         "thumbURL" : "rivers.jpg",
         "title" : "42",
         "subtitle" : "someValue",
         "bodyText" : ""]
        
        
        var colleccionPrimera = [mediaBModel] ()
        
        let temporarioCancion = mediaBModel (mediaURL: "https://firebasestorage.googleapis.com/v0/b/bellangelbond.appspot.com/o/basicpath%2F01%20Primavera.m4a?alt=media&token=44c42791-7837-46c4-939e-0212f27050b3", wrapperType: "ma4", kind: "song", artistId: 000, collectionId: 001, trackId: 001, artistName: "Rafael Gintoli", collectionName: "El Angel de la Musica", trackName: "Primavera", composser: "Antonio Vivaldi", collectionCensoredName: "", trackCensoredName: "", artistViewUrl: "", collectionViewUrl: "", trackViewUrl: "", previewUrl: "", artworkUrl60: "", artworkUrl100: "", primaryGenreName: "")
        
        colleccionPrimera.append(temporarioCancion)
        
        let temporarioCancion2 = mediaBModel (mediaURL: "https://firebasestorage.googleapis.com/v0/b/bellangelbond.appspot.com/o/basicpath%2F02%20O.%20Mio%20Bambino%20Caro.m4a?alt=media&token=1bdba28b-ce20-45c5-9a10-39aa3e0e3887", wrapperType: "ma4", kind: "song", artistId: 000, collectionId: 001, trackId: 002, artistName: "Monica Capra", collectionName: "El Angel de la Musica", trackName: "O Mio Babbino Caro", composser: "Giacomo Puccini", collectionCensoredName: "", trackCensoredName: "", artistViewUrl: "", collectionViewUrl: "", trackViewUrl: "", previewUrl: "", artworkUrl60: "", artworkUrl100: "", primaryGenreName: "")
        
        colleccionPrimera.append(temporarioCancion2)
 
        let temporarioCancion3 = mediaBModel (mediaURL: "https://firebasestorage.googleapis.com/v0/b/bellangelbond.appspot.com/o/basicpath%2F03%20Polonesa%20Heroica.m4a?alt=media&token=b226676e-ecd0-43f7-9971-399ddec267e5", wrapperType: "ma4", kind: "song", artistId: 000, collectionId: 001, trackId: 003, artistName: "Horacio Lavandera", collectionName: "El Angel de la Musica", trackName: "Polonesa Heróica", composser: "Frédéric Chopin", collectionCensoredName: "", trackCensoredName: "", artistViewUrl: "", collectionViewUrl: "", trackViewUrl: "", previewUrl: "", artworkUrl60: "", artworkUrl100: "", primaryGenreName: "")
        
        colleccionPrimera.append(temporarioCancion3)
        
        let temporarioCancion4 = mediaBModel (mediaURL: "https://firebasestorage.googleapis.com/v0/b/bellangelbond.appspot.com/o/basicpath%2F04%20Adagio.m4a?alt=media&token=14929ff6-e480-44de-b067-71c290bfe124", wrapperType: "ma4", kind: "song", artistId: 000, collectionId: 001, trackId: 004, artistName: "Franco Luciani", collectionName: "El Angel de la Musica", trackName: "Adagio", composser: "Tomaso Albinoni", collectionCensoredName: "", trackCensoredName: "", artistViewUrl: "", collectionViewUrl: "", trackViewUrl: "", previewUrl: "", artworkUrl60: "", artworkUrl100: "", primaryGenreName: "")
        
        colleccionPrimera.append(temporarioCancion4)
        
        let temporarioCancion5 = mediaBModel (mediaURL: "https://firebasestorage.googleapis.com/v0/b/bellangelbond.appspot.com/o/basicpath%2F05%20Laudate%20Dominum.m4a?alt=media&token=9f780dde-fd94-4e14-8970-711f9b87f1bd", wrapperType: "ma4", kind: "song", artistId: 000, collectionId: 001, trackId: 005, artistName: "Maria Bullago", collectionName: "El Angel de la Musica", trackName: "Laudate Dominum", composser: "Wolfgang Amadeus Mozart", collectionCensoredName: "", trackCensoredName: "", artistViewUrl: "", collectionViewUrl: "", trackViewUrl: "", previewUrl: "", artworkUrl60: "", artworkUrl100: "", primaryGenreName: "")
        
        colleccionPrimera.append(temporarioCancion5)
        
        let temporarioCancion6 = mediaBModel (mediaURL: "https://firebasestorage.googleapis.com/v0/b/bellangelbond.appspot.com/o/basicpath%2F06%20Suite%20Nro%202%20Badinerie.m4a?alt=media&token=c97dc6a5-70ec-401b-82da-5c61bac90b50", wrapperType: "ma4", kind: "song", artistId: 000, collectionId: 001, trackId: 006, artistName: "Jorge de la Vega", collectionName: "El Angel de la Musica", trackName: "Suite no.2 en si mineur, Badinerie", composser: "Johann Sebastian Bach", collectionCensoredName: "", trackCensoredName: "", artistViewUrl: "", collectionViewUrl: "", trackViewUrl: "", previewUrl: "", artworkUrl60: "", artworkUrl100: "", primaryGenreName: "")
        
        colleccionPrimera.append(temporarioCancion6)
        
        let temporarioCancion7 = mediaBModel (mediaURL: "https://firebasestorage.googleapis.com/v0/b/bellangelbond.appspot.com/o/basicpath%2F07%20O%20Sole%20Mio.m4a?alt=media&token=87f1d81f-d211-44a5-aa48-07f5ade4b109", wrapperType: "ma4", kind: "song", artistId: 000, collectionId: 001, trackId: 007, artistName: "Darío Volonté", collectionName: "El Angel de la Musica", trackName: "O Sole Mio", composser: "Giovanni Capurro & Eduardo Di Capua", collectionCensoredName: "", trackCensoredName: "", artistViewUrl: "", collectionViewUrl: "", trackViewUrl: "", previewUrl: "", artworkUrl60: "", artworkUrl100: "", primaryGenreName: "")
        
        colleccionPrimera.append(temporarioCancion7)
        
        let temporarioCancion8 = mediaBModel (mediaURL: "https://firebasestorage.googleapis.com/v0/b/bellangelbond.appspot.com/o/basicpath%2F08%20Aria%20Suite%20Nro%203.m4a?alt=media&token=fef5dd22-adc4-4ad2-beca-c862db09ee77", wrapperType: "ma4", kind: "song", artistId: 000, collectionId: 001, trackId: 008, artistName: "Rodolfo Mederos", collectionName: "El Angel de la Musica", trackName: "Aria Suite N 3", composser: "Johann Sebastian Bach", collectionCensoredName: "", trackCensoredName: "", artistViewUrl: "", collectionViewUrl: "", trackViewUrl: "", previewUrl: "", artworkUrl60: "", artworkUrl100: "", primaryGenreName: "")
        
        colleccionPrimera.append(temporarioCancion8)
        
        let temporarioCancion9 = mediaBModel (mediaURL: "https://firebasestorage.googleapis.com/v0/b/bellangelbond.appspot.com/o/basicpath%2F09%20Dank%20Sei%20Dir%2C%20Herr.m4a?alt=media&token=ad986b84-c020-4ab4-b010-cab389777b69", wrapperType: "ma4", kind: "song", artistId: 000, collectionId: 001, trackId: 009, artistName: "Monica Capra", collectionName: "El Angel de la Musica", trackName: "Dank Sei Dir, Herr", composser: "George Frideric Handel", collectionCensoredName: "", trackCensoredName: "", artistViewUrl: "", collectionViewUrl: "", trackViewUrl: "", previewUrl: "", artworkUrl60: "", artworkUrl100: "", primaryGenreName: "")
        
        colleccionPrimera.append(temporarioCancion9)
        
        let temporarioCancion10 = mediaBModel (mediaURL: "https://firebasestorage.googleapis.com/v0/b/bellangelbond.appspot.com/o/basicpath%2F10%20Nocturno%20Nro%203%20Libestraum!%20(Suen%CC%83o%20De%20Amor).m4a?alt=media&token=65727514-243d-4760-b405-e1ecae512e57", wrapperType: "ma4", kind: "song", artistId: 000, collectionId: 001, trackId: 010, artistName: "Rafael Gintoli", collectionName: "El Angel de la Musica", trackName: "Liebestraum No. 3", composser: "Franz Liszt", collectionCensoredName: "", trackCensoredName: "", artistViewUrl: "", collectionViewUrl: "", trackViewUrl: "", previewUrl: "", artworkUrl60: "", artworkUrl100: "", primaryGenreName: "")
        
        colleccionPrimera.append(temporarioCancion10)
        
        let temporarioCancion11 = mediaBModel (mediaURL: "https://firebasestorage.googleapis.com/v0/b/bellangelbond.appspot.com/o/basicpath%2F11%20Habanera.m4a?alt=media&token=56a1b2f2-45d4-401f-868a-c8f69307430a", wrapperType: "ma4", kind: "song", artistId: 000, collectionId: 001, trackId: 011, artistName: "Vera Cirkovic", collectionName: "El Angel de la Musica", trackName: "Habanera", composser: "Carmen de Bizet", collectionCensoredName: "", trackCensoredName: "", artistViewUrl: "", collectionViewUrl: "", trackViewUrl: "", previewUrl: "", artworkUrl60: "", artworkUrl100: "", primaryGenreName: "")
        
        colleccionPrimera.append(temporarioCancion11)
        
        let temporarioCancion12 = mediaBModel (mediaURL: "https://firebasestorage.googleapis.com/v0/b/bellangelbond.appspot.com/o/basicpath%2F12%20Meditacio%CC%81n%20De%20Thais.m4a?alt=media&token=dcc8d443-9640-42d8-8ca7-e6bc0d1b749d", wrapperType: "ma4", kind: "song", artistId: 000, collectionId: 001, trackId: 012, artistName: "Haydee Schvartz & Elias Gurevich", collectionName: "El Angel de la Musica", trackName: "Meditación de Thais", composser: "Jules Massenet", collectionCensoredName: "", trackCensoredName: "", artistViewUrl: "", collectionViewUrl: "", trackViewUrl: "", previewUrl: "", artworkUrl60: "", artworkUrl100: "", primaryGenreName: "")
        
        colleccionPrimera.append(temporarioCancion12)
        
        let temporarioCancion13 = mediaBModel (mediaURL: "https://firebasestorage.googleapis.com/v0/b/bellangelbond.appspot.com/o/basicpath%2F13%20Exultate%2C%20Jubilate.m4a?alt=media&token=fa27c3b3-6648-46f5-9f2c-40f3372fb800", wrapperType: "ma4", kind: "song", artistId: 000, collectionId: 001, trackId: 013, artistName: "Maria Bugallo", collectionName: "El Angel de la Musica", trackName: "Exsultate, jubilate", composser: "Wolfgang Amadeus Mozart", collectionCensoredName: "", trackCensoredName: "", artistViewUrl: "", collectionViewUrl: "", trackViewUrl: "", previewUrl: "", artworkUrl60: "", artworkUrl100: "", primaryGenreName: "")
        
        colleccionPrimera.append(temporarioCancion13)
        
        let temporarioCancion14 = mediaBModel (mediaURL: "https://firebasestorage.googleapis.com/v0/b/bellangelbond.appspot.com/o/basicpath%2F14%20Claro%20De%20Luna.m4a?alt=media&token=02cca8f6-cc2f-4071-ae6b-5403ae649819", wrapperType: "ma4", kind: "song", artistId: 000, collectionId: 001, trackId: 014, artistName: "Horacio Lavandera", collectionName: "El Angel de la Musica", trackName: "Claro de Luna", composser: "Ludwig van Beethoven", collectionCensoredName: "", trackCensoredName: "", artistViewUrl: "", collectionViewUrl: "", trackViewUrl: "", previewUrl: "", artworkUrl60: "", artworkUrl100: "", primaryGenreName: "")
        
        colleccionPrimera.append(temporarioCancion14)
        
        let temporarioCancion15 = mediaBModel (mediaURL: "https://firebasestorage.googleapis.com/v0/b/bellangelbond.appspot.com/o/basicpath%2F15%20Nessun%20Dorma.m4a?alt=media&token=1443c605-b11e-48a9-aeb6-7d491e3d4187", wrapperType: "ma4", kind: "song", artistId: 000, collectionId: 001, trackId: 015, artistName: "Darío Volonté", collectionName: "El Angel de la Musica", trackName: "Nessun dorma", composser: "Giacomo Puccini'", collectionCensoredName: "", trackCensoredName: "", artistViewUrl: "", collectionViewUrl: "", trackViewUrl: "", previewUrl: "", artworkUrl60: "", artworkUrl100: "", primaryGenreName: "")
        
        colleccionPrimera.append(temporarioCancion15)

        let temporarioCancion16 = mediaBModel (mediaURL: "https://firebasestorage.googleapis.com/v0/b/bellangelbond.appspot.com/o/basicpath%2F16%20Summertime.m4a?alt=media&token=30dc8082-9a0d-4f40-bc8b-0a5005af3e37", wrapperType: "ma4", kind: "song", artistId: 000, collectionId: 001, trackId: 016, artistName: "Emme", collectionName: "El Angel de la Musica", trackName: "Summertime", composser: "George Gershwin", collectionCensoredName: "", trackCensoredName: "", artistViewUrl: "", collectionViewUrl: "", trackViewUrl: "", previewUrl: "", artworkUrl60: "", artworkUrl100: "", primaryGenreName: "")
        
        colleccionPrimera.append(temporarioCancion16)
        
        let temporarioCancion17 = mediaBModel (mediaURL: "https://firebasestorage.googleapis.com/v0/b/bellangelbond.appspot.com/o/basicpath%2F17%20Alfonsina%20Y%20El%20Mar.m4a?alt=media&token=bfa269a2-ef50-4a00-bde7-c80db9d9f85e", wrapperType: "ma4", kind: "song", artistId: 000, collectionId: 001, trackId: 017, artistName: "Luis Salinas", collectionName: "El Angel de la Musica", trackName: "Alfonsina y el mar", composser: "Ariel Ramírez & Félix Luna,", collectionCensoredName: "", trackCensoredName: "", artistViewUrl: "", collectionViewUrl: "", trackViewUrl: "", previewUrl: "", artworkUrl60: "", artworkUrl100: "", primaryGenreName: "")
        
        colleccionPrimera.append(temporarioCancion17)

       /*
         let formatter = DateFormatter()
         //2016-12-08 03:37:22 +0000
         formatter.dateFormat = "yyyy&MM&dd&HH:mm"
         let now = Date()
         let dateString = formatter.string(from:now)
         
         let groceryItem = newFeed(newsDate: "",url: "Temporario URL", thumbURL: "Temporaio thumb", title: "Temorario Title", subtitle: "Temporario subtitle", bodyText: "temporario body")
         */
        
         // 3
        let encoder2 = JSONEncoder ()
        listOfSong.removeAll()
        
        for toSave in colleccionPrimera {
            
            var codigoKey = toSave.trackName + "&&" + toSave.artistName + "&&" + toSave.composser
            
            //'.' '#' '$' '[' or ']''
            
           
            let data2 = try! encoder2.encode(toSave)
            let string2 = String(data: data2, encoding: .utf8)!
            // 4
         //   groceryItemRef.setValue(groceryItem.toAnyObject())
            
            
            var str2 = codigoKey.replacingOccurrences(of: " ", with: "")
            codigoKey = str2.replacingOccurrences(of: ".", with: "")
            str2 = codigoKey.replacingOccurrences(of: "#", with: "")
            codigoKey = str2.replacingOccurrences(of: "$", with: "")
            str2 = codigoKey.replacingOccurrences(of: "[", with: "")
            codigoKey = str2.replacingOccurrences(of: "]", with: "")
            
            
            
             listOfSong.append(codigoKey)
            
             advengers.shared.mediaRef.child(codigoKey).setValue(string2)
        }
        
        
        
 
        
        
        
        // ================================== WRITING PATH MEDIA  ================================
        var canciones = [String] ()
        canciones.append("fdsfsd")
        
        let primerpath = pathDiscover (idPath: "pathInicio", pathName: "Initiation Path", pathSubtitle: "The firs step to discover", urlImage: "", urlThumb: "", listaDeMedia: listOfSong)
        
         let groceryItemRef = advengers.shared.pathsRef.child("pathInicio")
        
        let encoder = JSONEncoder()
   
        
        // 1
        let data = try! encoder.encode(primerpath)
        // 2
        print ("Esto es DATA")
        print(data)
        let string = String(data: data, encoding: .utf8)!
        
        print(string)
        
        groceryItemRef.setValue(string)
        
        
        advengers.shared.pathsRef.observe(.value, with: { snapshot in
            
            print("CONTO \(snapshot.childrenCount) Childrens")
            
            if snapshot.childrenCount > 0 {
                
                print("CONTO CHILDERSS???")
                if let noticia = snapshot.value as? NSDictionary {
                    
                    print("Esto es la noticia")
                    print(noticia)
                    print("Value for noticia")
                    print(noticia.value(forKey: "pathInicio"))
                    
                    for elemento2 in noticia.allValues  {

                      
                        print("Esto es Elemento 2")
                        print(elemento2 as! String)
                        let elemento3 = elemento2 as! String
                        print("Esto es Elemento 3")
                        print (elemento3)
                        let decoder = JSONDecoder ()
                        let dataP = elemento3.data(using: .utf8)!
                        let contendioDelPath = try! decoder.decode(pathDiscover.self, from: dataP)
                        print("FINALLLL")
                        print (contendioDelPath.pathSubtitle)

                        
              
                        
                        
                    }
                    
               //----------
                    
                 /*
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
                    */
                // -------
                    
                    
        
            
               
                    
                    for elemento in noticia.allValues {
                        
            
                        
                        /*
                        // advengers.shared.newfeeds.removeAll()
                        if let individual = elemento as? NSDictionary {
                            
                            let elementoNoticia = newFeed(newsDate: individual.value(forKey: "newsDate") as? String ?? "",url: individual.value(forKey: "url") as? String ?? "", thumbURL: individual.value(forKey: "thumbURL") as? String ?? "", title: individual.value(forKey: "title") as? String ?? "", subtitle: individual.value(forKey: "subtitle") as? String ?? "", bodyText: individual.value(forKey: "bodyText") as? String ?? "")
                            
                            //advengers.shared.newfeeds.append(elementoNoticia)
                            
                            
                        }
                        */
                       //self.tabla.reloadData()
                    }
                }
            }
        })
        
                    
                    
        
                
                /*
                 for news in (snapshot.children.allObjects as! [String: AnyObject ]) {
                 
                 
                 //let objetNews = news.value as? [String: AnyObject]
                 // let tituloNews = objetNews?[""]
                 // print("Encontro esto \(news.codeDate)")
                 }
                 
                 */
                
                
        
        

        
    
    
       
         
  
         
         
         
         /*
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
         
         */
        
        
    }
    



}
