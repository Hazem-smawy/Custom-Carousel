//
//  Model.swift
//  Custom Carousel
//
//  Created by hazem smawy on 9/29/22.
//

import SwiftUI


struct Movie: Identifiable, Equatable {
    var id = UUID().uuidString
    var movieTitle: String
    var artwork:String
}

var moveis :[Movie] = [
    Movie(
      movieTitle: "Better apps. Less code.",
      artwork: "10"
      ),
    Movie(
      movieTitle: "Everyone can code.",
      artwork: "11"
    ),
    Movie(
      movieTitle: "Everyone can code with us.",
      artwork: "9"
    ),
    Movie(
      movieTitle: "Better apps. Less code.",
      artwork: "1"
      ),
    Movie(
      movieTitle: "Dramatic new look.",
      artwork: "2"
    ),
    Movie(
      movieTitle: "Bring Your iPad App to Mac.",
      artwork: "4"
   
    ),
    Movie(
      movieTitle: "Engaging way to learn coding.",
      artwork: "5"
    ),
    Movie(
      movieTitle: "Engaging coding.",
      artwork: "6"
    ),
    Movie(
      movieTitle: " learn coding.",
      artwork: "7"
    )
]
