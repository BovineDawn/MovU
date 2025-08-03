//
//  HomeView.swift
//  Movu
//
//  Created by JG on 7/30/25.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        MapViewRepresentable()
            .ignoresSafeArea()
    }
}

#Preview {
    HomeView()
}
