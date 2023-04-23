//
//  CopingStrategies.swift
//  MYND
//
//  Created by Al on 4/22/23.
//

import Foundation
import SwiftUI

struct CopingStrategy {
    var title: String
    var steps: [String]
    
}

let strategies = [
    CopingStrategy(title: "Appreciate Yourself", steps:
                    ["Find an isolated place to relax",
                     "Close your eyes",
                     "Reflect on the atmosphere"]),
    CopingStrategy(title: "Draw a Picture", steps:
                    ["Gather paper and your writing utensil of choice",
                     "Think of something interesting to draw",
                     "Begin putting your thoughts onto paper"]),
    CopingStrategy(title: "Plant a Succulent", steps:
                    ["Find a pot, soil, and plant",
                     "Place the plant",
                     "Watch it grow"])
]
