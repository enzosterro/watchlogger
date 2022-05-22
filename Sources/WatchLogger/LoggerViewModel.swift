//
//  LoggerViewModel.swift
//
//
//  Created by Enzo Sterro on 21.06.2020.
//

import Foundation

public final class LoggerViewModel: ObservableObject {

    // MARK: Properties

    @Published var loggerURLs = [LoggerURL]()
    private let dataSource: LoggerDataSource

    // MARK: Init

    public init(dataSource: LoggerDataSource) {
        self.dataSource = dataSource
        loggerURLs = dataSource.provideLogURL()?.compactMap(LoggerURL.init) ?? []
    }

    func clearLogs() {
        dataSource.clearLogs()
        loggerURLs.removeAll()
    }

}

