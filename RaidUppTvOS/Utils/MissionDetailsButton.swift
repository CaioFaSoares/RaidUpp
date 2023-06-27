//
//  MissionDetailsButton.swift
//  RaidUppTvOS
//
//  Created by Daniele Cavalcante on 26/06/23.
//

import SwiftUI

struct MissionDetailsButton: View {
    let symbol: String
    let btnTitle: String
    
    init(symbol: String, btnTitle: String) {
        self.symbol = symbol
        self.btnTitle = btnTitle
    }
    
    var body: some View {
        VStack {
            ZStack {
                Rectangle()
                    .cornerRadius(5)
                Image(systemName: self.symbol)
                    .foregroundColor(.white)
            }
            Text(self.btnTitle)
        }
        .frame(width: 142, height: 114)
        .foregroundColor(Color("gray"))
    }
}

struct MissionDetailsButton_Previews: PreviewProvider {
    static var previews: some View {
        MissionDetailsButton(symbol: "star.fill", btnTitle: "teste")
    }
}
