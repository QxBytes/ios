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
                    ["1. Find an isolated place to relax",
                     "2. Close your eyes",
                     "3. Reflect on the atmosphere"]),
    CopingStrategy(title: "Draw a Picture", steps:
                    ["1. Gather paper and your writing utensil of choice",
                     "2. Think of something interesting to draw",
                     "3. Begin putting your thoughts onto paper"]),
    CopingStrategy(title: "Watch a Plant Grow", steps:
                    ["1. Take a few minutes to fix your gaze on a plant or tree before you. If you aren’t near either, imagine your favorite one before you. Even if you cannot see it, imagine it growing. Consider how its branches or stems extend, and how its leaves or blossoms unfurl.",
                     "2. Now, imagine yourself as a plant or tree. Feel yourself growing, extending, and unfurling.",
                     "3. Even if you cannot see or feel it, reflect on how you are always growing– your body generating new cells everyday."]),
    CopingStrategy(title: "Examine a Leaf", steps:
                    ["1. Find a leaf or a plant outside",
                     "2. Hold the leaf in your hand and then look closely at it",
                     "3. Consider everything that went into making this leaf: the sun, the soil, the water. Think about its complexity and consider your own complexity"]),
    CopingStrategy(title: "Breathe Equally", steps:
                    ["1. Find a place where you can get comfortable and close your eyes.",
                     "2. Inhale deeply through your nose for a count of four.",
                     "3. After feeling your lungs and midsection fill with air, exhale for a count of four. Repeat this process for several minutes as needed."]),
    CopingStrategy(title: "Hug Yourself", steps:
                    ["1. Cross your right arm across your chest, placing your right hand beneath your left armpit.",
                     "2. Close your eyes and breathe in. Imagine sensing warmth, love and safety. Do this several times throughout the day whenever your body is in need of extra love."]),
    CopingStrategy(title: "People-Watch at a Park", steps:
                    ["1. Pick a local park you’d like to spend some time at—a park that you know will be full of people.",
                     "2. Spend an afternoon in the park, either walking or relaxing.",
                     "3. Spend some time people-watching. Observe the interactions between other people at the park, taking in their happy moments. Let yourself be curious about and inspired by their conversations."]),
    CopingStrategy(title: "Recall a Moment of Support With a Friend", steps:
                    ["1. Try to think of a time in your life when a friend supported you. Choose a specific example of an experience you had with this person where you felt especially supported by him or her.",
                     "2. Spend a few minutes writing about what happened.",
                     "3. Consider the ways in which being supported made you feel and how this experience made you feel close and connected to the other person."]),
    
]
