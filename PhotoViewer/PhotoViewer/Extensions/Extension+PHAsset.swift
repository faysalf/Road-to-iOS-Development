//
//  Extension+PHAsset.swift
//  PhotoViewer
//
//  Created by Md. Faysal Ahmed on 3/11/22.
//

import Foundation
import Photos
import UIKit

extension PHAsset {
    var thumbnailSync: UIImage? {
        var result: UIImage?
        let targetSize = CGSize(width: 300, height: 300)  // The smallest thumbnail possible
        let options = PHImageRequestOptions()
        options.deliveryMode = .fastFormat
        options.isSynchronous = true
        options.isNetworkAccessAllowed = true  // having the thumbnail isn't optional
        PHImageManager.default().requestImage(for: self, targetSize: targetSize, contentMode: .aspectFill, options: options) { (image, info) in
            result = image
        }
        return result
    }
}
