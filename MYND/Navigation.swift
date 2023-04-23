//
//  Navigation.swift
//  MYND
//
//  Created by Al on 4/16/23.
//

import SwiftUI

struct Navigation: View {
    var body: some View {
        HStack {
                
            TabView {
                CopingSkills()
                    .tabItem {
                        Text("Home")
                    }
                
                Text("Second View")
                    .tabItem {
                        Text("Resources")
                    }
                
                Text("Third View")
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
