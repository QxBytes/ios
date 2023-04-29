//
//  CopingSkills.swift
//  MYND
//
//  Created by Al on 4/16/23.
//

import SwiftUI

struct CopingSkills: View {
    @State var isShowing = false;
    @State var data = strategies
    var body: some View {
        VStack {
            NavigationView {
                VStack(alignment: .leading) {
                    Text("Coping Strategies")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                    ForEach (data, id: \.self.title) { strat in
                        NavigationLink(destination: CopingSkillView(data: strat)) {
                            HStack {
                                Text(strat.title)
                                    .foregroundColor(.black)
                                    .frame(maxWidth: .infinity, alignment:.leading)
                                    .multilineTextAlignment(.leading)
                                Text("B")
                                    
                            }
                            .padding(Theming.md)
                            .background(
                                RoundedRectangle(cornerRadius: 10)
                                    .fill(Theming.fg)
                            )
                        }
                    }
                    
                    Spacer()
                }
                .padding(Theming.md)
                .background(Theming.bg)
            }
        }.background(Color(red: 0.95, green: 0.95, blue: 0.95))
    }
}

struct CopingSkills_Previews: PreviewProvider {
    static var previews: some View {
        CopingSkills()
    }
}
