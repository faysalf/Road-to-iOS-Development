//
//  PhotoManager.swift
//  PhotoViewer
//
//  Created by Md. Faysal Ahmed on 3/11/22.
//

import Foundation
import Photos

class PhotoManager {
    
    static let shared = PhotoManager()
    init() {}
    
    /// fetch the any kind of assets. Like image, video, audio etc.
    ///
    /// - parameters:
    ///   - startingDate: Starting date of assets if needed.
    ///   - endingDate: Ending date of assets if needed.
    ///   - subType :It's a `Struct` of the `Photos` module. The value may would be `photoPanorama, photoScreenshot, photoLive and .....so on`
    ///   - type : It's a `Enum` of the `Photos` module. The value may would be `image, video, audio and unknown`
    ///   - completion : The handler pass the fetched PHAsset.
    public class func fetchAssets(startingDate: Date? = nil,
                     endingDate: Date? = nil,
                     _ type: PHAssetMediaType,
                     _ subType: PHAssetMediaSubtype? = nil,
                     completionHanlder: @escaping (_ phAsset: [PHAsset]) -> Void) {
        
        let fetchOptions = PHFetchOptions()
        
        if let subType = subType {      //will work if subtype has given
            fetchOptions.predicate = NSPredicate(format: "(mediaSubtype & %d) != 0", subType.rawValue)
        }
        
        var isFilteredOperation : Bool = false
        var fromDate: Date = Date()
        var toDate: Date = Date()  //will work if start & end date given
        if let startingDate = startingDate, let endingDate = endingDate {
            isFilteredOperation = true
            fromDate = startingDate
            toDate = endingDate
        }
        
        //Just a way to set order
        let sortDescriptor = NSSortDescriptor(key: "creationDate", ascending: false)
        fetchOptions.sortDescriptors = [sortDescriptor]
        
        let phAssetResult = PHAsset.fetchAssets(with: type, options: fetchOptions)
        
        var assets = [PHAsset]()
        phAssetResult.enumerateObjects { (asset, index, stop) in
            
            // work if filter has given
            if isFilteredOperation {
                if let assetDate = asset.creationDate {
                    if fromDate <= assetDate && assetDate <= toDate {
                        assets.append(asset)
                    }
                }
            } else {
                assets.append(asset)
            }
        }       //
        completionHanlder(assets)      //send data to caller function
    }
    
}
