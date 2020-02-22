//
//  AirPlay.swift
//  hybridlockerapp
//
//  Created by Guillermo Anaya on 6/14/16.
//  Copyright © 2016 Facebook. All rights reserved.
//

import Foundation
import MediaPlayer



@objc(AirPlay)
class AirPlay: NSObject {
  
  var bridge: RCTBridge!

  override public static func requiresMainQueueSetup() -> Bool {
    return false;
  }
  
  @objc func startScan() -> Void {
    print("init airplay");
    
    NotificationCenter.default.addObserver(
      self,
      selector: #selector(AirPlay.airplayChanged(sender:)),
      name: AVAudioSession.routeChangeNotification,
      object: AVAudioSession.sharedInstance())
  }
  
  @objc func airplayChanged(sender: NSNotification) {
    let currentRoute = AVAudioSession.sharedInstance().currentRoute
    var isAirPlayPlaying = false
    for output in currentRoute.outputs {
      if output.portType == AVAudioSession.Port.airPlay {
        print("Airplay Device connected with name: \(output.portName)")
        isAirPlayPlaying = true
        break;
      }
    }
    
    self.bridge.eventDispatcher().sendDeviceEvent(withName: "airplayConnected", body: ["connected": isAirPlayPlaying])
  }
  
  @objc func isAlredyConnected(callback: RCTResponseSenderBlock) -> Void {
    let currentRoute = AVAudioSession.sharedInstance().currentRoute
    for output in currentRoute.outputs {
      if output.portType == AVAudioSession.Port.airPlay {
        print("Airplay Device connected with name: \(output.portName)")
        callback([true])
        //return true
      }
    }
    callback([false])
    //return false
  }
}

@objc(AirPlayButton)
class AirPlayButton: RCTViewManager {
  override func view() -> UIView! {
    let wrapperView = UIView(frame: CGRect(x: 0, y: 0, width: 40, height: 40))
    wrapperView.backgroundColor = UIColor.clear
    wrapperView.translatesAutoresizingMaskIntoConstraints = false
    
    let volumneView = MPVolumeView(frame: wrapperView.bounds)
    volumneView.showsVolumeSlider = false
    wrapperView.addSubview(volumneView)
    
    volumneView.sizeToFit()
    
    return wrapperView
  }
}
