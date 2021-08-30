//
//  SwiftUIView.swift
//  Countries
//
//  Created by Marcean, Dragos on 8/30/21.
//

import SwiftUI

struct LoadingView: View {
    var body: some View {
        ProgressView()
            .progressViewStyle(CircularProgressViewStyle(tint: .red))
            .scaleEffect(4)
    }
}


struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        LoadingView()
    }
}
