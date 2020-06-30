//
//  DateFormatters.swift
//  
//
//  Created by Enzo Sterro on 21.06.2020.
//

import Foundation

extension DateFormatter {

    static let timeFormatterForLogger: DateFormatter = {
        let formatter = DateFormatter()
        formatter.setLocalizedDateFormatFromTemplate("HHmmss")
        return formatter
    }()

    static let dateFormatterForLogger: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd-MM-yyyy"
        return formatter
    }()

}
