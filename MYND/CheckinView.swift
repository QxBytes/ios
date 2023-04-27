//
//  CheckinView.swift
//  MYND
//
//  Created by Al on 4/26/23.
//

import SwiftUI

func formatTimestamp(_ timestamp: Double) -> String {
    let date = Date(timeIntervalSince1970: timestamp / 1000)
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "MM/d/yy 'at' h:mm a"
    return dateFormatter.string(from: date)
}

struct CheckinView: View {
    @State var checkin: Checkin
    
    var body: some View {
        HStack {
            Text(checkin.mood.rawValue)
            Spacer()
            Text(formatTimestamp(checkin.timestamp*1000))
        }
        .padding(Theming.md)
        .frame(maxWidth: .infinity)
        .background(
            RoundedRectangle(cornerRadius: 10)
                .fill(Theming.fg)
        )
        
    }
}

struct CheckinView_Previews: PreviewProvider {
    static var checkin: Checkin = Checkin(timestamp: 1682549350723/1000, mood: Mood.GOOD, notes: "")
    static var previews: some View {
        CheckinView(checkin: checkin)
    }
}
