//
//  CopingSkillView.swift
//  MYND
//
//  Created by Al on 4/23/23.
//

import SwiftUI

struct CopingSkillView: View {
    @State var data: CopingStrategy
    var body: some View {
        VStack (alignment: .leading){
            Text(data.title)
                .font(.largeTitle)
                .fontWeight(.bold)
            ForEach(data.steps, id: \.self) { step in
                Text(step)
            }
            Spacer().frame(maxWidth: .infinity)
        }.padding(Theming.md).background(Theming.bg)
    }
}

struct CopingSkillView_Previews: PreviewProvider {
    static var previews: some View {
        CopingSkillView(data: CopingStrategy(title: "Coping Strategies", steps: ["Test1", "Step 2", "Step 3"]))
    }
}
