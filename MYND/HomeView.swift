//
//  HomeView.swift
//  MYND
//
//  Created by Al on 4/23/23.
//

import SwiftUI

struct MoodSelection: View {
    var label: String
    var emoji: String
    @Binding var selected: String
    @Binding var userData: UserData
    
    var body: some View {
        Button {
            selected = label
            let checkin = Checkin(timestamp: Date().timeIntervalSince1970, mood: Mood(rawValue: label)!, notes: "")
            userData.checkins.insert(checkin, at: 0)
            print("Added")
        } label: {
            VStack {
                Text(emoji)
                    .padding(.bottom, 1)
                Text(label)
                    .font(.system(size: 10))
                    .multilineTextAlignment(.center)
            }
            .frame(width: 40)
            .padding(Theming.sm)
            .background(selected == label ? .blue : Theming.fg)
            .foregroundColor(selected == label ? .white : .black)
            .cornerRadius(20)
        }
    }
}

struct HomeView: View {
    @State var selected = ""
    @State var notes = ""
    @Binding var userData: UserData
    var body: some View {
        VStack {
            Text("How are you feeling?")
                .font(.largeTitle)
                .fontWeight(.bold)
            HStack(spacing: 15) {
                MoodSelection(label: "Awful", emoji: "😔", selected: $selected, userData: $userData)
                MoodSelection(label: "Bad", emoji: "☹️", selected: $selected, userData: $userData)
                MoodSelection(label: "Okay", emoji: "😐", selected: $selected, userData: $userData)
                MoodSelection(label: "Good", emoji: "🙂", selected: $selected, userData: $userData)
                MoodSelection(label: "Great", emoji: "😊", selected: $selected, userData: $userData)
            }.background(Theming.bg)
            
            Divider()
            
            VStack {
                Text("Log")
                    .font(.title)
                if (!userData.checkins.isEmpty) {
                    ForEach(userData.checkins.prefix(7), id: \.self.timestamp) { checkin in
                        // timestamp is in seconds
                        CheckinView(checkin: checkin)
                    }
                } else {
                    Spacer()
                    Text("No Data")
                    Spacer()
                }
            }
            Spacer()
        }.padding(Theming.md).background(Theming.bg)
    }
}


struct HomeView_Previews: PreviewProvider {
    static var userData: UserData = UserData(checkins: [])
    static var previews: some View {
        HomeView(userData: Binding(get: {self.userData}, set: {self.userData = $0}))
    }
}
