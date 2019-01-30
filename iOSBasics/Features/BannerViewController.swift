//
//  BannerViewController.swift
//  iOSBasics
//
//  Created by kyoung hee park on 30/01/2019.
//  Copyright © 2019 MayPark. All rights reserved.
//

import Foundation
import UIKit

// self-scrolling banner view using UICollectionView
class BannerViewController : UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout  {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    var banners = [UIColor]()
    var isPlaying = false
    var currentBannderIdx = -1
    var maxBannerCnt = -1
    let scrollDuration = 2.0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
 
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        // load server data
        banners = [UIColor.gray, UIColor.lightGray, UIColor.brown]
        
        // initialize variables
        isPlaying = true
        currentBannderIdx = 0
        maxBannerCnt = banners.count * 10

        // reload collectionview data
        collectionView.reloadData()

        
        // start to play
        print("viewDidAppear. Start playing!")
        let blockSelf = self
        DispatchQueue.main.asyncAfter(deadline: .now() + scrollDuration) {
            blockSelf.showNextBanner()
        }
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        
        // stop playing
        print("viewDidDisappear. Stop playing!")
        isPlaying = false
        
    }
    
    func showNextBanner() {
        
        if !isPlaying {
            print("Stopped!")
            return
        }
        
        print("Create a job to show next banner!")
        
        collectionView.scrollToItem(at: IndexPath.init(row: currentBannderIdx, section: 0), at: .centeredHorizontally, animated:true)
        
        currentBannderIdx = (currentBannderIdx + 1) % maxBannerCnt
        
        // recursive call
        let blockSelf = self
        DispatchQueue.main.asyncAfter(deadline: .now() + scrollDuration) {
            blockSelf.showNextBanner()
        }
    }
}

extension BannerViewController {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return maxBannerCnt
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath)
        cell.contentView.backgroundColor = banners[indexPath.row % banners.count]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return collectionView.frame.size
    }
    
}


