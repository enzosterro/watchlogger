//
//  LoggerURL.swift
//
//
//  Created by Enzo Sterro on 21.06.2020.
//

import Foundation

struct LoggerURL: Identifiable {

    // MARK: Properties

    var id: Int { title.hashValue }
    let url: URL

    var content: String {
        (try? String(contentsOf: url, encoding: .utf8)) ?? "Empty"
    }

    var title: String {
        DateFormatter.dateFormatterForLogger.string(from: date)
    }

    var date: Date {
        let component = url.deletingPathExtension()
            .lastPathComponent
        return TimeInterval(component).flatMap { Date(timeIntervalSince1970: $0) } ?? Date()
    }

    // MARK: Init

    init(url: URL) {
        self.url = url
    }

}

// MARK: - Equatable

extension LoggerURL: Comparable {

    static func <(lhs: Self, rhs: Self) -> Bool {
        lhs.date < rhs.date
    }
    
}
