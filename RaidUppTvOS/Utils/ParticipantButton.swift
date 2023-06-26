//
//  ParticipantButton.swift
//  RaidUppTvOS
//
//  Created by Daniele Cavalcante on 23/06/23.
//

import SwiftUI

struct ParticipantButton: View {
    let imageName: String
    let name: String
    @State private var scale = CGSize(width: 1.0, height: 1.0)
    
    @Environment(\.isFocused) var isFocused
    
    init(imageName: String, name: String) {
        self.imageName = imageName
        self.name = name
    }
    
    var body: some View {
        VStack(spacing: 10) {
            Image(self.imageName)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .clipShape(Circle())
            if (CGSizeEqualToSize(scale, CGSize(width: 1.2, height: 1.2))) {
                Text(self.name)
                    .foregroundColor(.black)
            } else {
                Text(self.name)
                    .foregroundColor(.gray)
            }
        }
        .frame(width: 250, height: 292)
        .scaleEffect(scale)
        .focusable(true) { isFocused in
            if isFocused {
                scale = CGSize(width: 1.2, height: 1.2)
            } else {
                scale = CGSize(width: 1.0, height: 1.0)
            }
        }
    }
}

struct ParticipantButton_Previews: PreviewProvider {
    static var previews: some View {
        ParticipantButton(imageName: "participant", name: "Daniele")
    }
}
