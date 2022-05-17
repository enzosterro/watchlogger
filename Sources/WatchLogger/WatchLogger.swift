//
//  WatchLogger.swift
//
//
//  Created by Enzo Sterro on 21.06.2020.
//

import Foundation
import os

public enum WatchLogger {

    public static func log(_ message: String = "", type: OSLogType = .debug, filename: String = #file, function: String = #function, line: Int = #line) {
        #if !RELEASE
        os_log(type, "%@:%d, %@ %@", NSString(string: filename).lastPathComponent, line, function, message)
        log(String(format: "%@:%d, %@ %@", NSString(string: filename).lastPathComponent, line, function, message))
        #endif
    }

    private static let documentsDirectory: URL? = {
        FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first
    }()

    private static var logFile: URL? {
        let startOfTheDay = Calendar.current.startOfDay(for: Date()).timeIntervalSince1970
        return documentsDirectory?.appendingPathComponent("\(startOfTheDay).log")
    }

    private static func log(_ message: String) {
        guard let logFile = logFile else { return }

        let timestamp = DateFormatter.timeFormatterForLogger.string(from: Date())
        guard let data = (timestamp + ": " + message + "\n").data(using: .utf8) else { return }

        if FileManager.default.fileExists(atPath: logFile.path) {
            if let fileHandle = try? FileHandle(forWritingTo: logFile) {
                fileHandle.seekToEndOfFile()
                fileHandle.write(data)
                fileHandle.closeFile()
            }
        } else {
            try? data.write(to: logFile, options: .atomicWrite)
        }
    }

}
