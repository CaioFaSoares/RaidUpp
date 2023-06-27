//
//  MissionBoardView.swift
//  RaidUppTvOS
//
//  Created by Daniele Cavalcante on 19/06/23.
//

import SwiftUI

struct MissionBoardView: View {
    let guild: String
    let missionTypes: [MissionTypeImage] = [.bronze, .silver, .gold]
    let missionCount = 4

    @EnvironmentObject var entityFetcher: EntityFetcher

    var body: some View {
        VStack {
            BoardHeader(
                title: self.guild.capitalized,
                firstSubheadline: "Lorem ipsum dorem",
                secondSubheadline: "13 missões concluídas"
            )
            .focusSection()
            .padding(.bottom, 20)

            VStack(spacing: 50) {
                ForEach(missionTypes, id: \.title) { missionType in
                    VStack {
                        Text("\(missionType.title.capitalized) missions")
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .foregroundColor(.gray)
                        ScrollView(.horizontal) {
                            HStack(spacing: 30) {
                                ForEach(0..<missionCount) { _ in
                                    NavigationLink {
                                        MissionDetailsView(
                                            missionTitle: "Mission title",
                                            startDate: "20/05/2023",
                                            endDate: "26/05/2023",
                                            missionDescription: "Mission description.",
                                            missionLeaders: ["alumni", "alumni"],
                                            rating: 3,
                                            image: missionType.title
                                        ).environmentObject(entityFetcher)
                                    } label: {
                                        MissionCard(
                                            image: missionType.image,
                                            title: "Mission title",
                                            description: "Mission description"
                                        ).buttonStyle(.card)
                                    }
                                    .buttonStyle(.card)
                                }
                            }
                            .padding(80)
                        }
                        .padding(-80)
                    }
                }
            }
        }
        .background {
            Image("bg-03")
        }
    }
}

struct MissionBoardView_Previews: PreviewProvider {
    static var previews: some View {
        MissionBoardView(guild: "Design").environmentObject(EntityFetcher())
    }
}
