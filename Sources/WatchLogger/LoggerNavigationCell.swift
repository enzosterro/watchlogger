//
//  LoggerNavigationCell.swift
//
//
//  Created by Enzo Sterro on 21.06.2020.
//

import SwiftUI

struct LoggerNavigationCell: View {

    // MARK: Properties

    @State private var isPresented = false
    let model: LoggerURL

    // MARK: Body

    var body: some View {
        Button(model.title) { isPresented.toggle() }
            .sheet(isPresented: $isPresented) { LoggerContent(content: model.content) }
    }

}
