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
    CopingStrategy(title: "Watch a Plant Grow", steps:
                    ["Take a few minutes to fix your gaze on a plant or tree before you. If you aren’t near either, imagine your favorite one before you. Even if you cannot see it, imagine it growing. Consider how its branches or stems extend, and how its leaves or blossoms unfurl.",
                     "Now, imagine yourself as a plant or tree. Feel yourself growing, extending, and unfurling.",
                     "Even if you cannot see or feel it, reflect on how you are always growing– your body generating new cells everyday."]),
    CopingStrategy(title: "Examine a Leaf", steps:
                    ["Find a leaf or a plant outside",
                     "Hold the leaf in your hand and then look closely at it",
                     "Consider everything that went into making this leaf: the sun, the soil, the water. Think about its complexity and consider your own complexity"]),
    CopingStrategy(title: "Breathe Equally", steps:
                    ["Find a place where you can get comfortable and close your eyes.",
                     "Inhale deeply through your nose for a count of four.",
                     "After feeling your lungs and midsection fill with air, exhale for a count of four. Repeat this process for several minutes as needed."]),
    CopingStrategy(title: "Hug Yourself", steps:
                    ["Cross your right arm across your chest, placing your right hand beneath your left armpit.",
                     "Close your eyes and breathe in. Imagine sensing warmth, love and safety. Do this several times throughout the day whenever your body is in need of extra love."]),
    CopingStrategy(title: "People-Watch at a Park", steps:
                    ["Pick a local park you’d like to spend some time at—a park that you know will be full of people.",
                     "Spend an afternoon in the park, either walking or relaxing.",
                     "Spend some time people-watching. Observe the interactions between other people at the park, taking in their happy moments. Let yourself be curious about and inspired by their conversations."]),
    CopingStrategy(title: "Recall a Moment of Support With a Friend", steps:
                    ["Try to think of a time in your life when a friend supported you. Choose a specific example of an experience you had with this person where you felt especially supported by him or her.",
                     "Spend a few minutes writing about what happened.",
                     "Consider the ways in which being supported made you feel and how this experience made you feel close and connected to the other person."]),
    
]
