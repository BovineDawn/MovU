//
//  LocationSearchResults.swift
//  Movu
//
//  Created by JG on 8/3/25.
//

import SwiftUI

struct LocationSearchResults: View {
    var body: some View {
        HStack {
            Image(systemName: "mappin.circle.fill")
                .resizable()
                .foregroundColor(.blue)
                .accentColor(.white)
                .frame(width: 40, height: 40)
            
            VStack(alignment: .leading, spacing: 3) {
                Text("Burger King")
                    .font(.body)
                
                Text("1234 E. Main St, Phoenix AZ ")
                    .font(.system(size: 15))
                    .foregroundColor(.gray)
                
                Divider()
            }
            .padding(.leading, 9)
            .padding(.vertical, 9)
        }
        .padding(.leading)
    }
}

#Preview {
    LocationSearchResults()
}
