//
//  LocationSearchResults.swift
//  Movu
//
//  Created by JG on 8/3/25.
//

import SwiftUI

struct LocationSearchResults: View {
    let title: String
    let subtitle: String
    var body: some View {
        HStack {
            Image(systemName: "mappin.circle.fill")
                .resizable()
                .foregroundColor(.blue)
                .accentColor(.white)
                .frame(width: 40, height: 40)
            
            VStack(alignment: .leading, spacing: 3) {
                Text(title)
                    .font(.body)
                
                Text(subtitle)
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

struct LocationSearchResults_Previews: PreviewProvider {
    static var previews: some View {
        LocationSearchResults(title: "Starbucks", subtitle: "111 Main St, Anytown, USA")
    }
}
