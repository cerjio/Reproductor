//
//  ViewController.swift
//  Reproductor
//
//  Created by cerjio on 25/12/15.
//  Copyright © 2015 cerjio. All rights reserved.
//

import UIKit
import AVFoundation
import MediaPlayer

class ViewController: UIViewController, AVAudioPlayerDelegate {

    @IBOutlet weak var portada: UIImageView!
    @IBOutlet weak var nombreCancion: UILabel!
    @IBOutlet weak var artista: UILabel!
    @IBOutlet weak var playPause: UIBarButtonItem!
    @IBOutlet weak var barVolume: UIView!
    @IBOutlet weak var sliderVolume: UISlider!
    
    var reproductorReferencia : AVAudioPlayer!
    var cancionSeleccionadaReferencia : Cancion!
    let imagePlay : UIImage = UIImage(named: "play")!
    let imagePause : UIImage = UIImage(named: "pause")!
    
    override func viewWillAppear(animated: Bool) {
        
        portada.image = cancionSeleccionadaReferencia.portada
        nombreCancion.text = cancionSeleccionadaReferencia.nombreCancion.componentsSeparatedByString("-").first!
        artista.text = cancionSeleccionadaReferencia.nombreCancion.componentsSeparatedByString("-").last!
        if reproductorReferencia.playing {
            playPause.image = imagePause
        }
        
        reproductorReferencia.delegate = self
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func playPause(sender: AnyObject) {
        
        if reproductorReferencia.playing {
            reproductorReferencia.pause()
            playPause.image = imagePlay

        } else {
            reproductorReferencia.play()
             playPause.image = imagePause
        }
    }
    
    @IBAction func stop(sender: AnyObject) {
        reproductorReferencia.stop()
        reproductorReferencia.currentTime = 0.0
        playPause.image = imagePlay
        
    }
    
    func audioPlayerDidFinishPlaying(player: AVAudioPlayer, successfully flag: Bool) {
        
        playPause.image = imagePlay
    }
    
    
    @IBAction func showVolume(sender: AnyObject) {
        
        barVolume.hidden = false
        sliderVolume.maximumValue = 1.0
        sliderVolume.value = reproductorReferencia.volume
        
        /* Esto no funciona en el simulador
        let wrapperView = UIView(frame: CGRectMake(10, 80, (self.view.bounds.size.width)-20, 160))
        self.view.backgroundColor = UIColor.clearColor()
        self.view.addSubview(wrapperView)
        let volumeView = MPVolumeView(frame: wrapperView.bounds)
        wrapperView.addSubview(volumeView)*/
   
        
    }
    
    @IBAction func sliderValueDidChange(sender: UISlider) {
       
        reproductorReferencia.volume = sender.value
    
    }

    @IBAction func backgroundTap(sender: UIControl) {
        barVolume.hidden = true
        barVolume.resignFirstResponder()
    }

}

