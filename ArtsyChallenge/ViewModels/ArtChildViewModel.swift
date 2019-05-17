//
//  ArtChildViewModel.swift
//  ArtsyChallenge
//
//  Created by Mithran Natarajan on 5/15/19.
//  Copyright © 2019 Mithran Natarajan. All rights reserved.
//

import Foundation
class ArtChildViewModel {
    private var paitings: [Painting] = []

    private var artists: [Artist] = []

    private var auctions: [Auction] = []
    
    private var auctionStages: [String] = ["Current Live Auctions", "Current Timed Auctions",  "Lots by Artists you Follow"]

    init() {
        populateData()
    }

    private func populateData() {
        let painting: Painting = Painting(price: "$6,500", artist: "Pablo Picasso", location: "Le crapaud, 1949", agency: "ArtRite", imageUrl: "https://picsum.photos/id/870/200/300")
        paitings = [Painting](repeating: painting, count: 10)

        let artist: Artist = Artist(name: "PABLO PICASSO", artistPic: "https://picsum.photos/id/237/60/60", info: "4 works added")
        artists = [Artist](repeating: artist, count: 3)

        let auction: Auction = Auction(imageUrl: "https://picsum.photos/id/870/200/300", artistName: "PABLO PICASSO", currentStatus: "LIVE IN 1 MIN", isLive: true)
        auctions = [Auction](repeating: auction, count: 10)
    }
}

extension ArtChildViewModel {
    var artistCount: Int {
        return artists.count
    }

    var paintingCount: Int {
        return paitings.count
    }

    var auctionCount: Int {
        return auctions.count
    }
    
    var auctionStageCount: Int {
        return auctionStages.count
    }

    func getArtist(at index: Int) -> Artist {
        return artists[index]
    }

    func getPainting(at index: Int) -> Painting {
        return paitings[index]
    }

    func getAuction(at index: Int) -> Auction {
        return auctions[index]
    }
    
    func getAuctionStage(at index: Int) -> String {
        return auctionStages[index]
    }
}
