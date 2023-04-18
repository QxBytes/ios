//
//  CopingSkills.swift
//  MYND
//
//  Created by Al on 4/16/23.
//

import SwiftUI

struct CopingSkills: View {
    @State var isShowing = false;
    var body: some View {
        VStack {
            NavigationView {
                VStack(alignment: .leading) {
                    Text("Coping Strategies")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                    NavigationLink(destination: Text("1")) {
                        HStack {
                            Text("Appreciate yourself")
                                .foregroundColor(.black)
                                .frame(maxWidth: .infinity, alignment:.leading)
                            Text("B")
                                
                        }
                        .padding(20)
                        .background(
                            RoundedRectangle(cornerRadius: 10)
                                .fill(.gray)
                        )
                    }
                    NavigationLink(destination: Text("1")) {
                        Button(action: { }) {
                            Text("Appreciate yourself")
                                .foregroundColor(.black)
                                .frame(maxWidth: .infinity, alignment:.leading)
                                .padding(10)
                            Text("Bookmarked")
                                
                        }.buttonStyle(.bordered)
                    }
                    NavigationLink(destination: Text("1")) {
                        Button(action: { }) {
                            Text("Appreciate yourself")
                                .foregroundColor(.black)
                                .frame(maxWidth: .infinity, alignment:.leading)
                                .padding(10)
                            Text("Bookmarked")
                                
                        }.buttonStyle(.bordered)
                    }
                    Spacer()
                }
            }
        }.padding(20)
    }
}

struct CopingSkills_Previews: PreviewProvider {
    static var previews: some View {
        CopingSkills()
    }
}
