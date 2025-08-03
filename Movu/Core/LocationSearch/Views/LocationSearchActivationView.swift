//
//  LocationSearchActivationView.swift
//  Movu
//
//  Created by JG on 8/3/25.
//

import SwiftUI

struct LocationSearchActivationView: View {
    var body: some View {
        HStack {
            
            Rectangle()
                .fill(Color.black)
                .frame(width: 9, height: 9)
                .padding(.horizontal)
            
            Text("What's your destination?")
                .foregroundColor(Color(.darkGray))
            
            Spacer()
        }
        .frame(width: UIScreen.main.bounds.width - 64, height: 50)
        .background(Rectangle()
            .fill(Color.white)
            .shadow(color: .black, radius: 6))
    }
}

#Preview {
    LocationSearchActivationView()
}
