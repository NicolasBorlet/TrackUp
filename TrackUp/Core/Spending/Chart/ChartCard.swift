//
//  ChartCard.swift
//  TrackUp
//
//  Created by Nicolas Borlet on 09/01/2025.
//

import SwiftUI

struct ChartCard: View {
    var body: some View {
        VStack {
            HStack {
                VStack(alignment: .leading) {
                    Text("Last 7 days")
                    HStack {
                        Text("$341.02")
                        HStack {
                            Image(systemName: "arrow.down")
                            Text("11%")
                        }
                        .foregroundColor(Color.red)
                    }
                }
                
                Spacer()
                
                VStack(alignment: .trailing) {
                    Text("Avg day")
                    Text("$17")
                }
            }
            SpendingChart()
        }
        .padding()
        .background(Color.white)
        .cornerRadius(10)
        .shadow(color: Color.black.opacity(0.05), radius: 5, x: 0, y: 1)
    }
}
