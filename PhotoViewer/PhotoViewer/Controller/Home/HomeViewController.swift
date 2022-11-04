//
//  HomeViewController.swift
//  PhotoViewer
//
//  Created by Md. Faysal Ahmed on 3/11/22.
//

import UIKit
import Photos

class HomeViewController: UIViewController {
    
    @IBOutlet weak var homeCollectionView: UICollectionView!
    
    private var assets: [PHAsset] = [PHAsset]()

    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupCollectionView()
        loadAssets()
    }
    
    private func setupCollectionView() {
        let nib = UINib(nibName: "ImageCollectionViewCell", bundle: nil)
        homeCollectionView.register(nib, forCellWithReuseIdentifier: "cell")
        homeCollectionView.delegate = self
        homeCollectionView.dataSource = self
    }
    
    // MARK: - Private methods-
    private func loadAssets() {
        PhotoManager.fetchAssets(.image) {[weak self] phAssetArray in
            guard let self = self else { return }
            self.assets = phAssetArray //Asset Array rakhlam

//take from global (another background dispatch) queue to main queue
            DispatchQueue.main.async {

                self.homeCollectionView?.reloadData()
            }
        }
//        PhotoManager.fetchAssets( //mm-dd-yyyy
//            startingDate: NSDate(dateString:"10-12-2022") as Date, endingDate: NSDate(dateString:"10-30-2022") as Date, .image) {[weak self] phAssetArray in
//            guard let self = self else { return }
//            self.assets = phAssetArray
//        }
        
        DispatchQueue.main.async {
            self.homeCollectionView.reloadData()
        }
    }
}


extension HomeViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return assets.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = homeCollectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! ImageCollectionViewCell
        
        cell.img.image = assets[indexPath.row].thumbnailSync
        
        return cell
        
    }
    
}


extension HomeViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        
        return 2.0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        
        return 2.0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let width = view.frame.width
        return CGSize(width: width/4 - 2, height: width/4 - 2)
    }
}
