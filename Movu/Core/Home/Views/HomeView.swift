//
//  HomeView.swift
//  Movu
//
//  Created by JG on 7/30/25.
//

import SwiftUI

struct HomeView: View {
    @State private var showLocationSearchView = false
    var body: some View {
        ZStack(alignment: .top) {
            MapViewRepresentable()
                .ignoresSafeArea()
            
            if !showLocationSearchView {
                LocationSearchView(showLocationSearchView: $showLocationSearchView)
            } else {
                LocationSearchActivationView()
                    .padding(.top, 65)
                    .onTapGesture {
                        withAnimation(.spring()) {
                            showLocationSearchView.toggle()
                        }
                    }
            }
            
            MapViewActionButton(showLocationSearchView: $showLocationSearchView)
                .padding(.leading)
        }
    }
}

#Preview {
    HomeView()
}
