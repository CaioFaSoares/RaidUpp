//
//  CalendarButton.swift
//  RaidUppTvOS
//
//  Created by Daniele Cavalcante on 26/06/23.
//

import SwiftUI

struct CalendarButton: View {
    var body: some View {
        ZStack {
            Text("Calendar")
        }
        .frame(width: 220, height: 60)
        .foregroundColor(.black)
        .background(Color(.white).opacity(0.7))
        .cornerRadius(15)
    }
}

struct CalendarButton_Previews: PreviewProvider {
    static var previews: some View {
        CalendarButton()
    }
}
