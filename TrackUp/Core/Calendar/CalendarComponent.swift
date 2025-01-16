//
//  Calendar.swift
//  TrackUp
//
//  Created by Nicolas Borlet on 09/01/2025.
//

import SwiftUI

// Modèle pour représenter un prélèvement mensuel
struct Payment {
    let date: Date
    let type: String
    let icon: String // Utilisation d'un nom d'icône SF ou d'un emoji pour simplifier
}

struct CalendarComponent: View {
    @State private var color: Color = .blue
    @State private var date = Date.now
    @State private var selectedDate: Date? = nil // Nouvelle propriété pour la date sélectionnée
    @State private var showSheet = false // Afficher le sheet
    
    let daysOfWeek = Date.capitalizedFirstLettersOfWeekdays
    let columns = Array(repeating: GridItem(.flexible()), count: 7)
    @State private var days: [Date] = []
    
    // Exemple de données de prélèvements
    let payments: [Payment] = [
        Payment(date: Calendar.current.date(bySettingHour: 0, minute: 0, second: 0, of: Date())!, type: "Loyer", icon: "house.fill"),
        Payment(date: Calendar.current.date(byAdding: .day, value: 1, to: Date())!, type: "Électricité", icon: "bolt.fill"),
        Payment(date: Calendar.current.date(byAdding: .day, value: 2, to: Date())!, type: "Netflix", icon: "tv.fill"),
        Payment(date: Calendar.current.date(byAdding: .day, value: 1, to: Date())!, type: "Téléphone", icon: "phone.fill")
    ]
    
    var body: some View {
        LazyVGrid(columns: columns) {
            ForEach(days, id: \.self) { day in
                if day.monthInt != date.monthInt {
                    Text("")
                } else {
                    ZStack {
                        // Affichage de la date dans un cercle
                        Text(day.formatted(.dateTime.day()))
                            .fontWeight(.bold)
                            .foregroundStyle(
                                Date.now.startOfDay == day.startOfDay
                                ? .white : .black
                            )
                            .frame(maxWidth: .infinity, minHeight: 40)
                            .background(
                                Circle()
                                    .foregroundStyle(
                                        Date.now.startOfDay == day.startOfDay
                                        ? .appBlack
                                        : .appYellow
                                    )
                            )
                        
                        // Affichage des prélèvements dans le coin inférieur droit
                        let dayPayments = payments.filter { Calendar.current.isDate($0.date, inSameDayAs: day) }
                        if !dayPayments.isEmpty {
                            VStack {
                                Spacer()
                                HStack {
                                    Spacer()
                                    ForEach(0..<dayPayments.count, id: \.self) { index in
                                        if index == 0 {
                                            // Première icône (afficher un "+" si plusieurs prélèvements)
                                            ZStack {
                                                // Fond avec couleur blanche semi-transparente et flou
                                                Color.white
                                                    .opacity(0.6) // Opacité de 60%
                                                    .blur(radius: 10) // Effet de flou
                                                    .clipShape(Circle()) // Cercle pour l'effet de border radius infini
                                                
                                                // Icône du prélèvement
                                                Image(systemName: dayPayments[index].icon)
                                                    .resizable()
                                                    .frame(width: 18, height: 18)
                                                    .foregroundColor(.blue)
                                                
                                                // "+" si plusieurs prélèvements sont associés à la même date
                                                if dayPayments.count > 1 {
                                                    Text("+")
                                                        .font(.caption)
                                                        .foregroundColor(.blue)
                                                        .offset(x: 10, y: -10) // Position du "+"
                                                }
                                            }
                                            .frame(width: 30, height: 30) // Taille du ZStack pour s'assurer que tout s'adapte
                                            .offset(x: 10, y: 10) // Décalage pour positionner la ZStack en bas à droite
                                        }
                                    }
                                }
                                .padding(2)
                            }
                            .frame(maxWidth: .infinity, maxHeight: .infinity)
                        }
                    }
                    .frame(maxWidth: .infinity, minHeight: 40)
                    .onTapGesture {
                        // Lors du clic sur une date, on affiche le sheet
                        selectedDate = day
                        showSheet = true
                    }
                }
            }
        }
        .padding()
        .onAppear {
            days = date.calendarDisplayDays
        }
        .onChange(of: date) {
            days = date.calendarDisplayDays
        }
        .sheet(isPresented: $showSheet) {
            // Affichage du sheet avec les dépenses pour la date sélectionnée
            if let selectedDate = selectedDate {
                PaymentSheetView(date: selectedDate, payments: payments.filter { Calendar.current.isDate($0.date, inSameDayAs: selectedDate) })
            }
        }
    }
}
