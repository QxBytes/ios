//
//  ResourcesView.swift
//  MYND
//
//  Created by Al on 4/26/23.
//

import SwiftUI
struct SquareView: View {
    let imageName: String
    let text: String
    let link: String

    var body: some View {
        ScrollView {
            VStack(spacing: 5) {
                Image(imageName)
                    .resizable()
                    .scaledToFit()
                    .clipShape(Circle())
                Text(text)
                    .lineLimit(nil)
                    .multilineTextAlignment(.center)
                    .foregroundColor(.black)
                    .font(.system(size: 16, weight: .bold, design: .default))
            }
            .padding()
            .frame(width: 150, height: 150)
            .background(Color.white)
            .clipShape(RoundedRectangle(cornerRadius: 10))
            .overlay(
                RoundedRectangle(cornerRadius: 10)
                    .stroke(Color.gray.opacity(0.5), lineWidth: 1)
            )
            .onTapGesture {
                if let url = URL(string: link) {
                    UIApplication.shared.open(url)
                }
            }
        }
        .frame(maxWidth:.infinity, maxHeight:.infinity)
    }
}

struct ResourcesView: View {
    let squares = [
        SquareView(imageName: "square1", text: "Local Therapy", link: "https://www.findtreatment.gov/"),
        SquareView(imageName: "square2", text: "Local Support Groups", link: "https://www.samhsa.gov/find-support/health-care-or-support/support-group-or-local-program"),
        SquareView(imageName: "square3", text: "Online Therapy", link: "https://www.betterhelp.com/"),
        SquareView(imageName: "square4", text: "Online Support Groups", link: "https://www.heypeers.com/organizations/8/scheduled_meetings"),
        SquareView(imageName: "square5", text: "Mental Health Explained", link: "https://www.samhsa.gov/mental-health"),
        SquareView(imageName: "square6", text: "Websites For Me", link: "https://www.yourlifeyourvoice.org/Pages/home.aspx"),
        SquareView(imageName: "square7", text: "Acute Distress Help", link: "https://www.samhsa.gov/find-support/in-crisis"),
        SquareView(imageName: "square8", text: "Problem-specific Resources", link: "https://www.helpguide.org/"),
    ]

    var body: some View {
        VStack(alignment: .leading) {
            Text("Resources")
                .font(.largeTitle)
                .fontWeight(.bold)
            
            ScrollView {
                LazyVGrid(columns: [
                    GridItem(.flexible(), spacing: 16),
                    GridItem(.flexible(), spacing: 16),
                ], spacing: 16) {
                    ForEach(0..<min(squares.count, 8)) { index in
                        squares[index]
                    }
                }
                .padding()
            }
        }
        .padding(Theming.md)
        .background(Color(red: 0.95, green: 0.95, blue: 0.95))
    }
}

struct ResourcesView_Previews: PreviewProvider {
    static var previews: some View {
        ResourcesView()
    }
}
