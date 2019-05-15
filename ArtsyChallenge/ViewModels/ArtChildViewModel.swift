//
//  ArtChildViewModel.swift
//  ArtsyChallenge
//
//  Created by Mithran Natarajan on 5/15/19.
//  Copyright © 2019 Mithran Natarajan. All rights reserved.
//

import Foundation
class ArtChildViewModel {
    
    var paitings: [Painting] = []
    
    init() {
        populateData()
    }
    
    func populateData() {
        let painting: Painting = Painting(id: 1, price: 12000, artist: "Frank Stella", about: "East Euralia, from imaginary places, 1995", imageUrl: "")
        paitings = [Painting](repeating: painting, count: 10)
    }
}
