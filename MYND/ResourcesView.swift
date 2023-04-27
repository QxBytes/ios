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
                    .foregroundColor(.primary)
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
        SquareView(imageName: "square1", text: "Therapy", link: "https://www.google.com"),
        SquareView(imageName: "square2", text: "Support Groups", link: "https://www.apple.com"),
        SquareView(imageName: "square3", text: "", link: "https://www.amazon.com"),
        SquareView(imageName: "square4", text: "", link: "https://www.microsoft.com"),
        SquareView(imageName: "square5", text: "", link: "https://www.twitter.com"),
        SquareView(imageName: "square6", text: "", link: "https://www.facebook.com"),
        SquareView(imageName: "square7", text: "", link: "https://www.linkedin.com"),
        SquareView(imageName: "square8", text: "", link: "https://www.reddit.com"),
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
        .background(Theming.bg)
    }
}

struct ResourcesView_Previews: PreviewProvider {
    static var previews: some View {
        ResourcesView()
    }
}
