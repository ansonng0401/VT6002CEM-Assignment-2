////
////  SettingPageViewController.swift
////  VT6002CEM_Assignment2
////
////  Created by Anson on 5/1/2022.
////
//
//import UIKit
//import AVKit
//
//class SettingPageViewController: UIViewController {
//    var videoPlayer:AVPlayer?
//
//    var videoPlayerLayer:AVPlayerLayer?
//    var videoPlayerLooper:AVPlayerLooper?
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//
//        // Do any additional setup after loading the view.
//    }
//
//    override func viewWillAppear(_ animated: Bool) {
//
//        // Set up video in the background
//        setUpVideo()
//    }
//    func setUpVideo() {
//
//        // Get the path to the resource in the bundle
//        let bundlePath = Bundle.main.path(forResource: "VideoWithBlock", ofType: "mov")
//
//        guard bundlePath != nil else {
//            return
//        }
//
//        // Create a URL from it
//        let url = URL(fileURLWithPath: bundlePath!)
//
//        // Create the video player item
//        let item = AVPlayerItem(url: url)
//
//        // Create the player
//        self.videoPlayer = AVQueuePlayer(playerItem: item)
//
//        // Create the layer
//        self.videoPlayerLayer = AVPlayerLayer(player: videoPlayer!)
//        // VideoLooper
//       self.videoPlayerLooper = AVPlayerLooper(player: self.videoPlayer as! AVQueuePlayer, templateItem: item)
//        // Adjust the size and frame
//        self.videoPlayerLayer?.frame = CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: self.view.frame.size.height)
//
//        self.view.layer.insertSublayer(videoPlayerLayer!, at: 0)
//
//        // Add it to the view and play it
//        self.videoPlayer?.playImmediately(atRate: 1.0)
////        self.videoPlayer?.pause()
//
//    }
//
//
//}
//


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */


