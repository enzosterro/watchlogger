//
//  LoggerContent.swift
//
//
//  Created by Enzo Sterro on 21.06.2020.
//

import SwiftUI

struct LoggerContent: View {

    // MARK: Properties

    @State var text: String?
    let content: URL

    // MARK: Body

    var body: some View {
        if text == nil {
            Text("Loading Logs…")
                .foregroundColor(.secondary)
                .font(.subheadline)
                .onAppear {
                    URLSession.shared.dataTask(with: content) { data, _, _ in
                        text = data.flatMap { String(data: $0, encoding: .utf8) } ?? ""
                    }.resume()
                }
        } else if let text = text, !text.isEmpty {
            ScrollView {
                Text(text)
                    .font(.system(size: 9))
            }
        } else {
            VStack(spacing: 10) {
                Image(systemName: "nosign")
                Text("No Logs")
            }
            .font(.subheadline)
            .foregroundColor(.secondary)
        }
    }

}

// MARK: - Preview

struct LoggerContent_Previews: PreviewProvider {

    static var previews: some View {
        LoggerContent(content: URL(fileURLWithPath: ""))
    }

}
