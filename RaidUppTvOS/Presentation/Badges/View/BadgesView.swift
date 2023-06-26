//
//  BadgesView.swift
//  RaidUppTvOS
//
//  Created by Robson Lima Lopes on 19/06/23.
//

import SwiftUI

struct BadgesView: View {
    let guild: String
    let imagesNames: [String]

    @EnvironmentObject var entityFetcher: EntityFetcher

    var body: some View {
        VStack(spacing: 30) {
            BoardHeader(
                title: self.guild.capitalized,
                firstSubheadline: "Lorem ipsum dorem",
                secondSubheadline: "\(imagesNames.count) badges"
            ).focusSection()

            buildGrid()
                .padding(.horizontal, -80)

        }.background {
            Image("bg-05")
        }
    }

    private func buildGrid() -> some View {
        return ScrollView(showsIndicators: false) {
            LazyVGrid(
                columns: [
                    GridItem(.flexible()),
                    GridItem(.flexible()),
                    GridItem(.flexible()),
                    GridItem(.flexible()),
                    GridItem(.flexible())
                ],
                spacing: 50
            ) {
                ForEach(imagesNames.indices, id: \.self) { index in
                    let imageName = imagesNames[index]
                    Button(action: {}) {
                        Image(imageName)
                            .resizable()
                            .scaledToFit()
                            .id(index)
                    }
                    .buttonStyle(.plain)
                    .frame(
                        width: 250,
                        height: 250
                    )
                    .padding(40)
                }
            }
            .frame(width: 1740)
            .padding(40)
        }
        .frame(width: 1740)
    }
}

struct BadgesView_Previews: PreviewProvider {
    static var previews: some View {
        BadgesView(
            guild: "Design",
            imagesNames: [
                "bronze",
                "gold",
                "silver",
                "silver",
                "gold",
                "bronze",
                "bronze",
                "gold",
                "silver",
                "silver",
                "gold",
                "bronze"
            ]

        ).environmentObject(EntityFetcher())
    }
}
