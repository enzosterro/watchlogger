//
//  LoggerView.swift
//
//
//  Created by Enzo Sterro on 21.06.2020.
//

import SwiftUI

public struct LoggerView: View {

    // MARK: View Model

    @ObservedObject private var viewModel: LoggerViewModel

    // MARK: Body

    public var body: some View {
        VStack {
            if viewModel.loggerURLs.isEmpty {
                VStack(spacing: 8) {
                    Spacer()
                    Image(systemName: "eyeglasses")
                        .font(.title3)
                    Text("No Logs")
                    Spacer()
                }
                .foregroundColor(.secondary)
            } else {
                List {
                    ForEach(viewModel.loggerURLs.sorted(by: <)) { model in
                        NavigationLink(destination: {
                            if #available(watchOS 8.0, *) {
                                LoggerContent(content: model.url)
                                    .navigationTitle(model.title)
                                    .navigationBarTitleDisplayMode(.inline)
                            } else {
                                LoggerContent(content: model.url)
                                    .navigationTitle(model.title)
                            }
                        }) {
                            Text(model.title)
                        }
                    }
                }
                .toolbar {
                    Button(action: viewModel.clearLogs) {
                        Text("Clear Logs")
                    }
                    .padding(.bottom, 5)
                }
            }
        }
    }

    // MARK: Init

    public init(viewModel: LoggerViewModel) {
        self.viewModel = viewModel
    }

}

// MARK: - PreviewProvider

struct LoggerView_Previews: PreviewProvider {

    private struct DataSource: LoggerDataSource {

        let date = Date()

        func provideLogURL() -> [URL]? {
            [URL(fileURLWithPath: "/\(date.addingTimeInterval(-60*60*25).timeIntervalSince1970).log"),
             URL(fileURLWithPath: "\(date.timeIntervalSince1970).log"),
             URL(fileURLWithPath: "11-10-2021.log")]
        }

        func clearLogs() {}

    }

    static var previews: some View {
        LoggerView(viewModel: LoggerViewModel(dataSource: DataSource()))
        LoggerView(viewModel: LoggerViewModel(dataSource: FileManager.default))
    }

}

