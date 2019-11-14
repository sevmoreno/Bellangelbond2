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
import MediaPlayer

class PlayerMusciViewController: UIViewController {
    
    var player: AVPlayer!
    var playerLayer: AVPlayerLayer!
    var isVideoPlaying = false
    var mediaToPlay = mediaBModel ()
    var indexToPlayIndex = 8
    var mediaToPlayCode: String = ""
    var mediaAnalized = MediaJubal()
    
    @IBOutlet weak var sliderReaccion: UISlider!
    
    @IBOutlet weak var currentTime: UILabel!
    @IBOutlet weak var sliderConnect: UISlider!
    @IBOutlet weak var viewRecurso: UIView!
    @IBOutlet weak var totalTime: UILabel!
    
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        // Pureba local.
         let resourceURL = URL (string: mediaToPlay.mediaURL)!
        
        let urlPath = Bundle.main.url(forResource: "APM", withExtension: "wav")
       // let TileUrl = Bundle.main.url(forResource: "04Adagio", withExtension: "m4a")
        print ("Este es el paht \(urlPath)")
        
        player = AVPlayer (url: urlPath!)
        playerLayer = AVPlayerLayer (player: player)
        playerLayer.videoGravity = .resize
        viewRecurso.layer.addSublayer(playerLayer)
    //    player.currentItem?.addObserver(self, forKeyPath: "currentime", options: [.new,.initial], context: nil)
        player.currentItem?.addObserver(self, forKeyPath: "duration", options: [.new, .initial], context: nil)
        addTimeObserver()
        mediaToPlayCode = currentMediaPlayCode()
        
       
        
       
        /*
        
        let path = Bundle.main.url(forResource: "APM", withExtension: "wav")!
        
        let path2 = URL (string: "https://firebasestorage.googleapis.com/v0/b/bellangelbond.appspot.com/o/basicpath%2F07%20O%20Sole%20Mio.m4a?alt=media&token=87f1d81f-d211-44a5-aa48-07f5ade4b109")!
        
            print("Encontro el path")
           // let url2 = URL (string: path!)!
            let musicplayer = AVPlayer (url: path2)
            
        
            
            let playerViewController = AVPlayerViewController()
            playerViewController.player = musicplayer
            
            present(playerViewController, animated: true) {
                musicplayer.play()
            }
 */
        
       
 
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        player.play()
    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        playerLayer.frame = viewRecurso.bounds
        
    }
    
    func currentMediaPlayCode() -> String {
        
        var codigoKey = mediaToPlay.trackName + "&&" + mediaToPlay.artistName + "&&" + mediaToPlay.composser
        
     
        var str2 = codigoKey.replacingOccurrences(of: " ", with: "")
        codigoKey = str2.replacingOccurrences(of: ".", with: "")
        str2 = codigoKey.replacingOccurrences(of: "#", with: "")
        codigoKey = str2.replacingOccurrences(of: "$", with: "")
        str2 = codigoKey.replacingOccurrences(of: "[", with: "")
        codigoKey = str2.replacingOccurrences(of: "]", with: "")
        

        
        return codigoKey
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    @IBAction func playButton(_ sender: UIButton) {
        
        if isVideoPlaying {
            player.pause()
            sender.setTitle("Play", for: .normal)
        } else {
            player.play()
            sender.setTitle("Pause", for: .normal)
        }
        
        isVideoPlaying = !isVideoPlaying 
    }
    
    @IBAction func fastFoward(_ sender: Any) {
        guard let duration = player.currentItem?.duration else {return}
            let currenTime = CMTimeGetSeconds(player.currentTime())
        let newtime: Double = currenTime + 5.0
        if newtime < CMTimeGetSeconds(duration) - 5.0 {
            let time = CMTimeMake (value: Int64(newtime * 1000), timescale: 1000)
            player.seek(to: time)
        }
    }
    
    
    
    @IBAction func rewinButton(_ sender: Any) {
        
        let currenTime = CMTimeGetSeconds(player.currentTime())
        var newtime: Double = currenTime - 5.0
        if newtime < 0 {
            newtime = 0
        }
        
        let time = CMTimeMake (value: Int64(newtime * 1000), timescale: 1000)
        player.seek(to: time)
    }
    
    @IBAction func sliderReacction(_ sender: Any) {
        
        mediaAnalized.codigokeysong = mediaToPlayCode
        let duration = CMTimeGetSeconds(player.currentTime())
        let elemento = mediaBeets (reaction: Double(sliderReaccion!.value), time: duration)
        mediaAnalized.mediaBts.append(elemento)
    //    print(elemento)
        
        // TODO: PARA SABER CUANDO GRABAMOS LA ANALIZADA  DidDisappear
        
        
        
        
    }
    
    
    @IBAction func sliderChange(_ sender: UISlider) {
    }
    
    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        if keyPath == "duration", let duration = player.currentItem?.duration.seconds, duration > 0.0 {
            self.totalTime.text = getTimeString(from: player.currentItem!.duration)
        }
    }
    
    
    func getTimeString(from time: CMTime) -> String {
        let totalSeconds = CMTimeGetSeconds(time)
        let hours = Int(totalSeconds/3600)
        let minutes = Int(totalSeconds/60) % 60
        let seconds = Int(totalSeconds.truncatingRemainder(dividingBy: 60))
        if hours > 0 {
            return String(format: "%i:%02i:%02i", arguments: [hours,minutes,seconds])
        }else {
            return String(format: "%02i:%02i", arguments: [minutes,seconds])
        }
    }
    
    func addTimeObserver() {
        let interval = CMTime(seconds: 0.5, preferredTimescale: CMTimeScale(NSEC_PER_SEC))
        let mainQueue = DispatchQueue.main
        _ = player.addPeriodicTimeObserver(forInterval: interval, queue: mainQueue, using: { [weak self] time in
            guard let currentItem = self?.player.currentItem else {return}
            self?.sliderConnect.maximumValue = Float(currentItem.duration.seconds)
            self?.sliderConnect.minimumValue = 0
            self?.sliderConnect.value = Float(currentItem.currentTime().seconds)
            self?.currentTime.text = self?.getTimeString(from: currentItem.currentTime())
        })
    }
}
