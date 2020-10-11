//
//  MenuItem.swift
//
//
//  Created by Enzo Sterro on 21.06.2020.
//

import SwiftUI

struct MenuItem: View {

    // MARK: Properties

    let action: () -> Void
    let label: LocalizedStringKey
    let iconName: String

    // MARK: Body

    var body: some View {
        Button(action: action) {
            VStack {
                #if os(watchOS)
                Image(systemName: iconName).font(.title)
                #endif
                Text(label)
            }
        }
    }

}
