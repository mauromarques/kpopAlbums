//
//  item.swift
//  ecommerce
//
//  Created by Mauro Canhao on 20/07/21.
//

import SwiftUI

struct Item: Identifiable{
    var id = UUID().uuidString
    var title: String
    var subTitle: String
    var price: String
    var rating: String
    var image: String
    var versions: [AlbumVersion]
    var liked: Bool
    var description: String
}

struct AlbumVersion: Identifiable{
    var id = UUID().uuidString
    var name: String
    var cover: String
}

var items = [
    Item(title: "Eyes Wide Open", subTitle: "TWICE", price: "$19", rating: "3,5", image: "eyesWideOpen_style", versions: [AlbumVersion(name: "Style version", cover: "eyesWideOpen_style"), AlbumVersion(name: "Story version", cover: "eyesWideOpen_story"), AlbumVersion(name: "Retro version", cover: "eyesWideOpen_retro")], liked: false, description: "Eyes Wide Open (stylized in sentence case) is the second Korean studio album (fourth overall) by South Korean girl group Twice. It was released on October 26, 2020, by JYP Entertainment and Republic Records. It is the group's first Korean full-length album in nearly three years, following Twicetagram (2017). The group's sophomore album features thirteen songs including the lead single, 'I Can't Stop Me', and was released on the week of their fifth anniversary."),
    Item(title: "Taste of Love", subTitle: "TWICE", price: "$19", rating: "4,5", image: "tasteOfLove_taste", versions: [AlbumVersion(name: "Taste version", cover: "tasteOfLove_taste"), AlbumVersion(name: "Fallen version", cover: "tasteOfLove_fallen"), AlbumVersion(name: "In Love version", cover: "tasteOfLove_inLove")], liked: false, description: "Taste of Love is the tenth extended play by South Korean girl group Twice. It was released on June 11, 2021, through JYP Entertainment and Republic Records. The EP features six songs including the lead single 'Alcohol-Free'."),
    Item(title: "More&More", subTitle: "TWICE", price: "$19", rating: "5", image: "more&more_a", versions: [AlbumVersion(name: "A version", cover: "more&more_a"), AlbumVersion(name: "B version", cover: "more&more_b"), AlbumVersion(name: "C version", cover: "more&more_c")], liked: false, description: "More & More became Twice's best-selling album release to date, reaching over 563,000 copies sold on Gaon, while also becoming their first entry on the US Billboard 200, charting at number 200."),
    Item(title: "Feel Special", subTitle: "TWICE", price: "$19", rating: "4,9", image: "feelSpecial_a", versions: [AlbumVersion(name: "A version", cover: "feelSpecial_a"), AlbumVersion(name: "B version", cover: "feelSpecial_b"), AlbumVersion(name: "C version", cover: "feelSpecial_c")], liked: false, description: "Feel Special is the eighth extended play by the South Korean girl group Twice. It was released by JYP Entertainment on September 23, 2019, and features the title track of the same name as well as a Korean version of their Japanese single 'Breakthrough'."),
]

