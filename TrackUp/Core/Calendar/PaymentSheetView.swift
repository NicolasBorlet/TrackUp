//
//  PaymentSheetView.swift
//  TrackUp
//
//  Created by Nicolas Borlet on 16/01/2025.
//

import SwiftUI

struct PaymentSheetView: View {
    let date: Date
    let payments: [Payment]
    
    var body: some View {
        NavigationStack {
            VStack {
                Text("Dépenses pour le \(date.formatted(.dateTime.day().month().year()))")
                    .font(.headline)
                    .padding()
                
                List(payments, id: \.date) { payment in
                    HStack {
                        Image(systemName: payment.icon)
                            .foregroundColor(.blue)
                            .frame(width: 30, height: 30)
                        Text(payment.type)
                        Spacer()
                    }
                    .padding()
                }
            }
            .navigationTitle("Dépenses")
            .toolbar {
                ToolbarItem(placement: .primaryAction) {
                    Button("Fermer") {
                        // Ferme le sheet
                        // L'état `showSheet` est contrôlé par la vue parente, donc pas besoin de fermer explicitement ici
                    }
                }
            }
        }
    }
}
