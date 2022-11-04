//
//  Extension+NSDate.swift
//  PhotoViewer
//
//  Created by Md. Faysal Ahmed on 4/11/22.
//

import Foundation


extension NSDate {
    convenience
    init(dateString:String) {
        let dateStringFormatter = DateFormatter()
        dateStringFormatter.dateFormat = "MM-dd-yyyy"
        dateStringFormatter.locale = NSLocale(localeIdentifier: "en_US_POSIX") as Locale
        let d = dateStringFormatter.date(from: dateString)!
        self.init(timeInterval:0, since:d)
    }
}


//NSDate(dateString:"10-30-2022") as Date
