//
//  Book.swift
//  FourthWeek
//
//  Created by Lee Wonsun on 1/15/25.
//

import Foundation

struct Book: Decodable {
    let documents: [BookDetail]
    let meta: MetaDetail
}

struct BookDetail: Decodable, Equatable {
    let contents: String
    let price: Int
    let title: String
    let thumbnail: String
}

struct MetaDetail: Decodable {
    let is_end: Bool
}
