//
//  LoadingView.swift
//  WeatherApp
//
//  Created by Mohamed Ali on 06/07/2024.
//

import SwiftUI

struct LoadingView: View {
    var body: some View {
            ProgressView()
                .progressViewStyle(CircularProgressViewStyle(tint: .blue))
                .scaleEffect(2)
    }
}

#Preview {
    LoadingView()
}
