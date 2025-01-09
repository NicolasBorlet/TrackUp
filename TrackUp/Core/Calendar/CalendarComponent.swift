//
//  Calendar.swift
//  TrackUp
//
//  Created by Nicolas Borlet on 09/01/2025.
//

import SwiftUI

struct CalendarComponent: View {
    @State private var color: Color = .blue
    @State private var date = Date.now
    let daysOfWeek = Date.capitalizedFirstLettersOfWeekdays
    let columns = Array(repeating: GridItem(.flexible()), count: 7)
    @State private var days: [Date] = []
    var body: some View {
        LazyVGrid(columns: columns) {
            ForEach(days, id: \.self) { day in
                if day.monthInt != date.monthInt {
                    Text("")
                } else {
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
                                    :  .appYellow
                                )
                        )
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
    }
    
}

