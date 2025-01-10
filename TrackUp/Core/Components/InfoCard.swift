//
//  InfoCard.swift
//  TrackUp
//
//  Created by Nicolas Borlet on 10/01/2025.
//

import SwiftUI

struct InfoCard: View {
    var title: String
    var amount: String

    var body: some View {
        HStack(spacing: 12) {
            ZStack {
                Image(systemName: "pencil.circle.fill")
            }
            .frame(width: 35, height: 35)
            .padding(5)
            .background(.lightGray)
            .cornerRadius(5)
                        
            VStack(alignment: .leading) {
                Text(title)
                    .font(.FunnelSansRegular)
            
                Text(amount)
                    .font(.CardTitle)
            }
        }
        .padding()
        .background(Color.white)
        .cornerRadius(10)
        .shadow(color: Color.black.opacity(0.05), radius: 5, x: 0, y: 1)
        .frame(maxWidth: .infinity)
    }
}
