//
//  ContentView.swift
//  RaidUppTvOS
//
//  Created by Daniele Cavalcante on 13/06/23.
//

import SwiftUI

struct GuildView: View {
    let missionTypes: [MissionTypeImage] = [.bronze, .silver, .gold]
    let missionCount = 4
    
    var body: some View {
        ZStack {
            Image("background")
            VStack {
                Rectangle()
                    .foregroundColor(Color("gray-header"))
                    .frame(width: 1920, height: 380)
                    .ignoresSafeArea()
                Spacer()
            }
            
            HStack{
                MenuImageWithDescription(
                    imageName: "guilds",
                    title: "",
                    subtitle: "",
                    mentor: "Caroline Barreto"
                )
                VStack(alignment: .leading, spacing: 36) {
                    Text("Guildas")
                        .font(.title2)
                        .foregroundColor(.black)
                        .padding(.bottom, 100)
                    NavigationLink {
                        GuildMenuView(guildType: "code")
                    } label: {
                        MenuButton(title: "Programação")
                            .foregroundColor(.black)
                            .frame(width: 430, alignment: .leading)
                    }
                    .buttonStyle(.plain)
                    NavigationLink {
                        GuildMenuView(guildType: "design")
                    } label: {
                        MenuButton(title: "Design")
                            .foregroundColor(.black)
                            .frame(width: 430, alignment: .leading)
                    }
                    .buttonStyle(.plain)
                    NavigationLink {
                        GuildMenuView(guildType: "management")
                    } label: {
                        MenuButton(title: "Gestão")
                            .foregroundColor(.black)
                            .frame(width: 430, alignment: .leading)
                    }
                    .buttonStyle(.plain)
                }
                .padding(.leading, 80)
                .padding(.bottom, 150)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        GuildView()
    }
}
