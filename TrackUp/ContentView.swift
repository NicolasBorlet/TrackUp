//
//  ContentView.swift
//  TrackUp
//
//  Created by Nicolas Borlet on 09/01/2025.
//

import SwiftUI

struct ContentView: View {
    @State private var selectedTab = 0  // Garde la trace du tab sélectionné
    
    var body: some View {
        TabView(selection: $selectedTab) {
            Group {
                HomeView()
                    .tabItem {
                        Image(systemName: "house.fill")
                            .foregroundColor(selectedTab == 0 ? .black : .gray) // Noir si sélectionné, gris sinon
                    }
                    .tag(0) // Tag pour le suivi de l'index
                
                CalendarView()
                    .tabItem {
                        Image(systemName: "calendar")
                            .foregroundColor(selectedTab == 1 ? .black : .gray)
                    }
                    .tag(1)
                
                StatisticsView()
                    .tabItem {
                        Image(systemName: "chart.pie.fill")
                            .foregroundColor(selectedTab == 2 ? .black : .gray)
                    }
                    .tag(2)
                
                ProfileView()
                    .tabItem {
                        Image(systemName: "person.fill")
                            .foregroundColor(selectedTab == 3 ? .black : .gray)
                    }
                    .tag(3)
            }
            .toolbarBackground(.white, for: .tabBar)
            .toolbarBackground(.visible, for: .tabBar)
        }
        .accentColor(.black)  // Couleur des éléments sélectionnés (comme l'icône et le texte)
    }
}

#Preview {
    ContentView()
}
