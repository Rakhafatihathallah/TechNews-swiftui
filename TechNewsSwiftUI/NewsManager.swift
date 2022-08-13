//
//  NewsManager.swift
//  TechNewsSwiftUI
//
//  Created by Rakha Fatih Athallah on 13/07/22.
//

import Foundation


class NewsManager : ObservableObject {
    
    @Published var newsURL : String = "https://newsapi.org/v2/top-headlines?sources=techcrunch&apiKey=abfc00d5f4334b0292bada0c7478a094"
    
    @Published var newsModel : NewsModel?
    
    func getNews() -> () {
        
        guard let url = URL(string: newsURL) else { return }
        
       let task = URLSession.shared.dataTask(with: url) { data, response, error in
           
            do {
                if let data = data {
                    
                    let json = try JSONDecoder().decode(NewsModel.self, from: data)
                    DispatchQueue.main.async {
                        self.newsModel = json
                    }
                    
                }
            }catch{
                print("error --> \(error.localizedDescription)")
            }
            
        }
        task.resume()
    }
}
