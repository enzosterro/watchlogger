//
//  LoggerView.swift
//
//
//  Created by Enzo Sterro on 21.06.2020.
//

import SwiftUI

public struct LoggerView: View {

    // MARK: View Model

    @ObservedObject var viewModel: LoggerViewModel

    // MARK: Body

    public var body: some View {
        VStack(alignment: .center) {
            if viewModel.loggerURLs.isEmpty {
                Text("No Entries").font(.caption)
            } else {
                List {
                    ForEach(viewModel.loggerURLs.sorted(by: <), content: LoggerNavigationCell.init)
                }
            }
        }
        .contextMenu(menuItems: {
            MenuItem(action: viewModel.clearLogs, label: "Clear Logs", iconName: "trash")
        })
    }

    // MARK: Init

    public init(viewModel: LoggerViewModel) {
        self.viewModel = viewModel
    }

}
