//
//  LoggerURL.swift
//
//
//  Created by Enzo Sterro on 21.06.2020.
//

import Foundation

struct LoggerURL: Identifiable {

    // MARK: Properties

    let url: URL
    var id: Int { date.hashValue }


    var title: String {
        date.map(DateFormatter.dateFormatterForLogger.string(from:)) ?? "Unknown Date"
    }

    private var date: Date? {
        TimeInterval(url.deletingPathExtension().lastPathComponent)
            .map { Date(timeIntervalSince1970: $0) }
    }

}

// MARK: - Comparable

extension LoggerURL: Comparable {

    static func <(lhs: Self, rhs: Self) -> Bool {
        lhs.date.map { rhs.date?.compare($0) } == .orderedAscending
    }
    
}
