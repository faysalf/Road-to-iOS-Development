//
//  ViewController.swift
//  SimpleCollectionView
//
//  Created by Md. Faysal Ahmed on 03/08/22.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var top: UILabel!
    @IBOutlet weak var collectionView: UICollectionView!
    
    let countryName = ["Bangladesh", "Myanmar", "India", "Pakistan", "Russia", "China", "Japan", "Afganistan", "Maldiv", "SriLanka", "Qatar", "KSA", "USA", "England", "Canada","Nepal"]
    
    let countryFlag = ["ban", "myan", "ind", "pak", "russ", "chin", "jap", "afg", "mal", "sri", "qat", "ksa", "usa", "eng", "can", "nep",]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupCollectionView()
        
    }
    
    func setupCollectionView(){
        let nib = UINib(nibName: "CollectionViewCell", bundle: nil)
        collectionView.register(nib, forCellWithReuseIdentifier: "cell")
        collectionView.delegate = self
        collectionView.dataSource = self
        
    }
    
    
}


// MARK: - collection view deleget and data sorce
extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return min(countryName.count, countryFlag.count)
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! CollectionViewCell
        
        cell.configure(image: UIImage(imageLiteralResourceName: countryFlag[indexPath.row]), text: countryName[indexPath.row]) //UIImage(named: "Bangladesh")!
        return cell
    }
    
}
