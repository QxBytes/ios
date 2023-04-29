//
//  ColorSlider.swift
//  MYND
//
//  Created by Simin Mahaleh on 4/27/23.
//

import Foundation
import SwiftUI

struct ColorSlider: View {
    @Binding var value: Double

    var body: some View {
        GeometryReader { geometry in
            ZStack(alignment: .leading) {
                LinearGradient(gradient: Gradient(colors: [Color.red, Color.green]), startPoint: .leading, endPoint: .trailing)
                    .frame(height: 20)
                    .cornerRadius(10)
                Circle()
                    .fill(Color.white)
                    .frame(width: 30, height: 30)
                    .offset(x: CGFloat(value / 100) * (geometry.size.width - 30))
                    .gesture(
                        DragGesture(minimumDistance: 0)
                            .onChanged { gesture in
                                let newValue = Double(gesture.location.x / geometry.size.width) * 100
                                value = min(max(0, newValue), 100)
                            }
                    )
            }
        }
    }
}
