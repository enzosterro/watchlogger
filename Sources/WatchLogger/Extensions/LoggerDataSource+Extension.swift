//
//  LoggerDataSource.swift
//
//
//  Created by Enzo Sterro on 21.06.2020.
//

import Foundation

public protocol LoggerDataSource {

    func provideLogURL() -> [URL]?
    func clearLogs()

}

extension FileManager: LoggerDataSource {

    // MARK: Constants

    private enum Keys {

        static let logExtension = "log"

    }

    // MARK: Public Methods

    public func provideLogURL() -> [URL]? {
        guard let documentDirectory = Self.default.urls(for: .documentDirectory, in: .userDomainMask).first else { return nil }
        return (try? Self.default.contentsOfDirectory(at: documentDirectory, includingPropertiesForKeys: nil, options: .skipsHiddenFiles).filter { $0.lastPathComponent != Keys.logExtension })
    }

    public func clearLogs() {
        provideLogURL()?.forEach { try? Self.default.removeItem(at: $0) }
    }

}
