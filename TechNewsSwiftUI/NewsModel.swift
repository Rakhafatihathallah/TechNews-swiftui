//
//  NewsModel.swift
//  TechNewsSwiftUI
//
//  Created by Rakha Fatih Athallah on 13/07/22.
//

import Foundation


struct NewsModel : Codable, Hashable {
    let status: String
    let totalResults : Int
    let articles : [ArticleResult]
}

struct ArticleResult : Codable, Hashable {
    let sourceResults : SourceResults
    let author : String?
    let titles : String
    let description : String
    let urls : String
    let urlToImage : String?
    let publishedAt : String
    let content : String
    
    enum CodingKeys : String, CodingKey {
        case sourceResults = "source"
        case author
        case titles = "title"
        case description
        case urls = "url"
        case urlToImage
        case publishedAt
        case content
    }
}

struct SourceResults : Codable, Hashable {
    let idResult : String
    let names : String
    
    enum CodingKeys : String, CodingKey {
        case idResult = "id"
        case names = "name"
    }
}
