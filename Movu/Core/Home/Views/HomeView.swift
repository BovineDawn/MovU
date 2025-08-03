//
//  HomeView.swift
//  Movu
//
//  Created by JG on 7/30/25.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        ZStack(alignment: .top) {
            MapViewRepresentable()
                .ignoresSafeArea()
            
            LocationSearchActivationView()
                .padding(.top, 65)
            
            MapViewActionButton()
                .padding(.leading)
        }
    }
}

#Preview {
    HomeView()
}
