//
//  MissionDetails.swift
//  RaidUppTvOS
//
//  Created by Daniele Cavalcante on 16/06/23.
//

import SwiftUI

struct MissionDetails: View {
    let missionTitle: String
    let startDate: String
    let endDate: String
    let missionDescription: String
    let missionLeaders: [String]?
    var rating: Int = 0
    var image: String
    
    @FocusState private var isFocused1: Bool
    @FocusState private var isFocused2: Bool
    @FocusState private var isFocused3: Bool
    @EnvironmentObject var entityFetcher: EntityFetcher
    
    var body: some View {
        HStack {
            VStack(alignment: .trailing, spacing: 8) {
                HStack(spacing: 10) {
                    ForEach(0..<5) { index in
                        Image(systemName: index < rating ? "star.fill" : "star.fill")
                            .foregroundColor(index < rating ? .white : .white.opacity(0.5))
                    }
                }
                .padding(.top, 50)
                Text("Leaders")
                    .font(.caption2)
                    .foregroundColor(.black)
                    .padding(.top, 32)
                ForEach(missionLeaders?.prefix(2) ?? [], id: \.self) { leader in
                    Text(leader)
                        .foregroundColor(.gray)
                        .font(.caption)
                }
                Spacer()
            }
            .padding(.leading, -150)
            VStack(alignment: .leading, spacing: 16) {
                Text(self.missionTitle)
                    .font(.title2)
                    .foregroundColor(.black)
                HStack {
                    Text(self.startDate)
                    Text(self.endDate)
                }
                .font(.body)
                .foregroundColor(.gray)
                VStack {
                    Text(self.missionDescription)
                        .font(.body)
                        .foregroundColor(.black)
                        .frame(width: 823, height: 180, alignment: .leading)
                    Spacer()
                }
                .frame(width: 823, height: 180)
                
                HStack(spacing: 30) {
                    VStack {
                        Button {} label: {
                            Image(systemName: "heart.fill")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 35, height: 35)
                        }
                        .focused($isFocused1)
                        .foregroundColor(isFocused1 ? Color("gray") : .white)
                        Text("Finish")
                            .font(.caption2)
                    }
                    VStack {
                        Button {} label: {
                            Image(systemName: "star.fill")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 35, height: 35)
                        }
                        .focused($isFocused2)
                        .foregroundColor(isFocused2 ? Color("gray") : .white)
                        Text("Rate")
                            .font(.caption2)
                    }
                    VStack {
                        Button {} label: {
                            Image(systemName: "ellipsis")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 35, height: 35)
                        }
                        .focused($isFocused3)
                        .foregroundColor(isFocused3 ? Color("gray") : .white)
                        Text("More")
                            .font(.caption2)
                    }
                }
                .buttonStyle(.bordered)
                .foregroundColor(Color("gray"))
            }
            Spacer()
            Image(self.image)
                .resizable()
                .frame(width: 368, height: 368)
        }
        .padding(.leading, 100)
        .frame(width: 1505, height: 521)
    }
}

struct MissionDetails_Previews: PreviewProvider {
    static var previews: some View {
        MissionDetails(
            missionTitle: "Mission title",
            startDate: "DD/MM/YYYY",
            endDate: "DD/MM/YYYY",
            missionDescription: "Mission description here.",
            missionLeaders: ["Name 01", "Name 02", "Name 03"],
            rating: 4,
            image: "gold"
        ).environmentObject(EntityFetcher())
    }
}
