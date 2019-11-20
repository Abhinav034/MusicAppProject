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
    
    var isplaying = false
    var shuffle = false
    @IBOutlet weak var timeBar: UISlider!
    
    
    
    @IBOutlet weak var albumImage: UIImageView!
    
    
    @IBOutlet weak var PlayPauseButton: UIButton!
    
    
    @IBOutlet weak var shuffleBtn: UIButton!
    
    
    
    @IBOutlet weak var timeUp: UILabel!
    

    @IBOutlet weak var songNameLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupSong()
        
        
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
        
        audioPlayer.stop()
        audioPlayer.play()
        
        
        PlayPauseButton.setImage(UIImage(named: "media-pause"), for: .normal)
        isplaying = true
    
    
    }
    
    @objc func updateSlider(){
        timeBar.value = Float(audioPlayer.currentTime)
        
                let (ch, cm ,cs) = secondsToHoursMinutesSeconds(seconds: Int(audioPlayer.currentTime))
                let (th, tm, ts) = secondsToHoursMinutesSeconds(seconds: Int(audioPlayer.duration))
        
            let cTime = String(cm) + ":" + String(cs)
            let tTime = String(tm) + ":" + String(ts)
        
        timeUp.text = cTime + "/" + tTime
        
        if (Int(timeBar.value) >= Int(audioPlayer.duration)) {
            setNext()
        }
    }
    func secondsToHoursMinutesSeconds (seconds : Int) -> (Int, Int, Int) {
              return (seconds / 3600, (seconds % 3600) / 60, (seconds % 3600) % 60)
          }
    
    
    @IBAction func dragTimeBar(_ sender: UISlider) {
        
        audioPlayer.currentTime = TimeInterval(Float(timeBar.value)) // slider interaction
    }
    
    @IBAction func onTimeBarTouch(_ sender: UISlider) {
        setPlayPause()
    }
    
    
    @IBAction func onTouchExit(_ sender: UISlider) {
        setPlayPause()
    }
    
    
    @IBAction func playPausePressed(_ sender: UIButton) {
        
        
        setPlayPause()
        
        
    }
    
    func setPlayPause(){
        
        if isplaying {
            audioPlayer.pause()
            isplaying = false
            PlayPauseButton.setImage(UIImage(named: "media-play"), for: .normal)
          
        }
        else{
            audioPlayer.play()
            isplaying = true
            PlayPauseButton.setImage(UIImage(named: "media-pause"), for: .normal)
            
            
        }
      
    }
    
    
    @IBAction func previousPressed(_ sender: UIButton) {
       
        setPrevious()
        
    }
    
    func setPrevious(){
        if (shuffle) {
            currSong = Int.random(in: 0..<songs.count)
        }
        else if(currSong == 0){
            currSong = songs.count-1
        }
        else{
            currSong = currSong-1
        }
        setupSong()
    }
    
    @IBAction func nextPressed(_ sender: UIButton) {
        setNext()
    }
    func setNext(){
        if (shuffle) {
            currSong = Int.random(in: 0..<songs.count)
        }
        else if (currSong == songs.count - 1) {
                   currSong = 0
               }
        else{
            
            currSong = currSong+1
        }
        setupSong()
        
    }
    
    
    @IBAction func SufflePressed(_ sender: UIButton) {
        
        if (!shuffle) {
                shuffleBtn.setImage(UIImage(named: "shuffleno.png"), for: .normal)
            } else {
                shuffleBtn.setImage(UIImage(named: "shuffle.png"), for: .normal)
            }
            
            shuffle = !shuffle
        
        
    }
    
    
    
    
    @IBAction func ListButtonPressed(_ sender: UIButton) {
        
        dismiss(animated: true, completion: nil)
        
    }
    
    
    
    
    
   
    
    
    
    


    @IBAction func GenrePressed(_ sender: UINavigationItem) {
        
        
        
    }
}


