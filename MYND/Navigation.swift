//
//  Navigation.swift
//  MYND
//
//  Created by Al on 4/16/23.
//

import SwiftUI

struct Navigation: View {
    @State var userData: UserData = UserData(checkins: [])
    var body: some View {
        HStack {
                
            TabView {
                HomeView(userData: $userData)
                    .tabItem {
                        Text("Home")
                    }
                
                Text("Second View")
                    .tabItem {
                        Text("Resources")
                    }
                
                CopingSkills()
                    .tabItem {
                        Text("Coping")
                    }
            }
                
        }
    }
}

struct Navigation_Previews: PreviewProvider {
    static var previews: some View {
        Navigation()
    }
}
