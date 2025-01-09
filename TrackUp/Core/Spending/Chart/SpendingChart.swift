//
//  SpendingChart.swift
//  TrackUp
//
//  Created by Nicolas Borlet on 09/01/2025.
//

import SwiftUI
import Charts

struct DayData: Identifiable {
    var date: Date
    var count: Double
    var id = UUID()
}

struct SpendingChart: View {
    // State for the selected day
    @State var selectedDay: DayData?
    
    // Calculer les 7 derniers jours, y compris aujourd'hui
    var days: [DayData] {
        let calendar = Calendar.current
        let today = Date()
        var daysData = [DayData]()
        
        for i in 0..<7 {
            // Calculer la date pour le jour "i" dans la semaine (0 pour aujourd'hui, 1 pour hier, etc.)
            if let dayDate = calendar.date(byAdding: .day, value: -i, to: today) {
                // Assigner une valeur aléatoire pour chaque jour (vous pouvez adapter cette logique)
                let randomCount = Double.random(in: 1...10)
                daysData.append(DayData(date: dayDate, count: randomCount))
            }
        }
        
        return daysData.reversed() // On inverse l'ordre pour commencer par lundi
    }
    
    var body: some View {
        Chart {
            ForEach(days) { day in
                BarMark(
                    x: .value("Jour", day.date, unit: .day),
                    y: .value("Count", day.count)
                )
            }
        }
        .foregroundStyle(.appYellow)
        .padding()
        .frame(height: 300)
    }
}
