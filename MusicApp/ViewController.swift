//
//  ViewController.swift
//  MusicApp
//
//  Created by Abhinav Bhardwaj on 2019-11-20.
//  Copyright © 2019 Abhinav Bhardwaj. All rights reserved.
//

import UIKit
import AVFoundation
import MediaPlayer

var audioPlayer = AVAudioPlayer()
class ViewController: UIViewController {
    
    
    @IBOutlet weak var timeBar: UISlider!
    
    
    
    @IBOutlet weak var albumImage: UIImageView!
    
    
    @IBOutlet weak var PlayPauseButton: UIButton!
    
    
    @IBOutlet weak var shuffleBtn: UIButton!
    
    
    
    @IBOutlet weak var timeUp: UILabel!
    

    @IBOutlet weak var songNameLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        
    }
    
    
    
    func setupSong() {
        
        let songName = songs[currSong].name
        songNameLabel.text = songName
        
        
        let sound = Bundle.main.path(forResource: songName, ofType: "mp3")
        
        do{
            audioPlayer = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: sound!))
            try
            AVAudioSession.sharedInstance().setCategory(AVAudioSession.Category.playback, mode: AVAudioSession.Mode.default, options: [AVAudioSession.CategoryOptions.mixWithOthers])
            
            let playerItem = AVPlayerItem(url: URL(fileURLWithPath: sound!))
            let metadataList = playerItem.asset.metadata as [AVMetadataItem]
            
            for item in metadataList {
                           if item.commonKey == nil{
                               continue
                           }
                           
                           if let key = item.commonKey, let value = item.value {
                               print(key)
                               print(value)
                               if key.rawValue == "title" {
                                   //trackLabel.text = value as? String
                               }
                               if key.rawValue  == "artist" {
                                   //artistLabel.text = value as? String
                               }
                               if key.rawValue == "artwork" {
                                   if let audioImage = UIImage(data: (value as! NSData) as Data) {
                                       //println(audioImage.description)
                                       albumImage.image = audioImage
                                   }
                               }
                           }
                       }
                   }
        
        catch{
            print(error)
        }
        
        timeBar.maximumValue = Float(audioPlayer.duration)
        Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(ViewController.updateSlider), userInfo: nil, repeats: true)
        
        
    }
    
    
    
    
    
    
    
    
    
    
    
    
    


    @IBAction func GenrePressed(_ sender: UINavigationItem) {
        
        
        
    }
}

