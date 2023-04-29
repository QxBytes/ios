//
//  Navigation.swift
//  MYND
//
//  Created by Al on 4/16/23.
//
import Firebase
import FirebaseCore
import SwiftUI

struct Navigation: View {
    @State var userData: UserData = UserData(checkins: [])
    @State var db: DB;
    init() {
        FirebaseApp.configure()
        db = DB()
    }
    var body: some View {
        HStack {
                
            TabView {
                LoginView(userData: $userData, db: $db)
                    .tabItem {
                        Text("Profile")
                    }
                
                
                MeasurementView()
                    .tabItem {
                        Text("Home")
                    }
                
                HomeView(userData: $userData)
                    .tabItem {
                        Text("Mood Journal")
                    }
                
                ResourcesView()
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
