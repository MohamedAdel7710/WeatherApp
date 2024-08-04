//
//  WeatherCardView.swift
//  WeatherApp
//
//  Created by Mohamed Ali on 19/07/2024.
//

import SwiftUI


struct WeatherCard<Content: View>: View {
    var content: Content
    var title: String
    
    init(title: String, @ViewBuilder content: () -> Content) {
        self.title = title
        self.content = content()
    }
    
    var body: some View {
        VStack(alignment: .leading) {
            
            HStack {
                Text(title.uppercased())
                    .font(.headline)
                    .minimumScaleFactor(0.4)
                    .foregroundStyle(.white.opacity(0.7))
                Spacer()
            }
            .padding()
            
            self.content
                .padding(.horizontal)
            
            Spacer()
        }
        .frame(maxWidth: .infinity, maxHeight: 150)
        .background(.blue.opacity(0.2))
        .clipShape(RoundedRectangle(cornerRadius: 5.0))
    }
}

struct WeatherCardView: View {
    
    var body: some View {
        VStack {
            WeatherCard(title: "Feel Like") {
                Text("25")
            }
        }
    }
        
}

#Preview {
    WeatherCardView()
}
