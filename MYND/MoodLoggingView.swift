//
//  MoodLoggingView.swift
//  MYND
//
//  Created by Simin Mahaleh on 4/27/23.
//
import SwiftUI

struct MoodLoggingView: View {
    @Binding var moodData: [CGFloat]
    @State private var currentMood: String = ""

    var body: some View {
        VStack {
            Text("Log your mood")
                .font(.title)
                .padding()

            TextField("Enter your mood (0-1)", text: $currentMood)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
                .keyboardType(.decimalPad)

            Button(action: {
                if let moodValue = Float(currentMood), moodValue >= 0 && moodValue <= 1 {
                    moodData.append(CGFloat(moodValue))
                    currentMood = ""
                }
            }) {
                Text("Submit")
                    .foregroundColor(.white)
                    .padding()
                    .background(Color.blue)
                    .cornerRadius(8)
            }
        }
    }
}

