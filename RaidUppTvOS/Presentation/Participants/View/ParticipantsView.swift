//
//  ParticipantsView.swift
//  RaidUppTvOS
//
//  Created by Daniele Cavalcante on 22/06/23.
//

import SwiftUI

struct ParticipantsView: View {
    
    let participants: [[String]] = [
        ["Robson", "Yara", "Ieda", "Moyses", "Ana"],
        ["Caio", "Ayslana", "Helena", "Davi", "Nilia"],
        ["Daniele", "Calisto", "PH", "Luizin"]
    ]
    
    @State private var selectedIndex: Int = 0
    @State private var isFocused: Bool = false
    @FocusState var selected: Int?
    
    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 32) {
                Spacer()
                Text("Participants")
                    .font(.title2)
                    .foregroundColor(.black)
                    .padding(.bottom, 40)
                Text("Categories")
                    .font(.caption2)

                Button(action: {
                    self.selectedIndex = 0
                }) {
                    Text("Code")
                }
                .focused($selected, equals: 0)
                Button(action: {
                    self.selectedIndex = 1
                }) {
                    Text("Design")
                }
                .focused($selected, equals: 1)
                Button(action: {
                    self.selectedIndex = 2
                }) {
                    Text("Management")
                }
                .focused($selected, equals: 2)
                Spacer()
            }
            .foregroundColor(.black)
            .frame(alignment: .leading)
            .font(.body)
            .buttonStyle(.plain)
            .focusSection()
            .onChange(of: selected) { newValue in
                if let newValue {
                    selectedIndex = newValue
                }
            }
            ScrollView {
                LazyVGrid(
                    columns: [
                        GridItem(.flexible()),
                        GridItem(.flexible()),
                        GridItem(.flexible()),
                        GridItem(.flexible())
                    ],
                    spacing: 60
                ) {
                    ForEach(participants[selectedIndex].indices, id: \.self) { index in
                        ParticipantButton(
                            imageName: participants[selectedIndex][index],
                            name: participants[selectedIndex][index]
                        )
                    }
                }
                .focusSection()
                .padding(.leading, 100)
            }
            .frame(width: 1170, height: 1000)
        }
        .background {
            Image("background")
        }
    }
}

struct ParticipantsView_Previews: PreviewProvider {
    static var previews: some View {
        ParticipantsView()
    }
}
