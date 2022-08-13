//
//  ContentView.swift
//  TechNewsSwiftUI
//
//  Created by Rakha Fatih Athallah on 13/07/22.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var newsObj : NewsManager
    @State var selectedData : Bool = false
    var body: some View {
        TabView{
            NavigationView{
                NewsFeedList()
                    .navigationTitle("Tech News")
            }.tabItem {
                Image(systemName: "newspaper.fill")
                Text("News")
            }.tag(0)
            NavigationView{
                ProfileView()
            }.tabItem {
                Image(systemName: "person.circle")
                Text("Profile")
            }.tag(1)
        }
    }
    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            ContentView()
        }
    }
    
    struct NewsFeedList : View {
        @EnvironmentObject var newsObj : NewsManager
        let fontSize = FontSize()
        var body: some View {
            let jsonData = newsObj.newsModel
            let response = jsonData
            
            List(response?.articles ?? [], id:\.self){ news in
                let url = URL(string: news.urlToImage ?? "")
                NavigationLink(){
                    DetailView(nameImage: news.urlToImage ?? "", nameTitle: news.titles, nameAuthor: news.author ?? "", nameContent: news.content, nameURL: news.urls, namePublished: news.publishedAt)
                } label: {
                    VStack{
                        AsyncImage(url: url) { Image in
                            Image
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                            
                        } placeholder: {
                            ZStack{
                                RoundedRectangle(cornerRadius: 0)
                                    .foregroundColor(.gray)
                                    .aspectRatio(contentMode: .fit)
                                ProgressView()
                                    .progressViewStyle(CircularProgressViewStyle())
                            }
                        }


                        HStack{
                            VStack(alignment: .leading, spacing: 10){
                                Text(news.titles)
                                    .font(fontSize.title)
                                    .fontWeight(.bold)
                                    .lineLimit(3)
                                Text(news.description)
                                    .font(fontSize.description)
                                    .fontWeight(.medium)
                                    .foregroundColor(.gray)
                            }
                            Spacer()
                        }
                        .padding()
                    }
                }
            }.onAppear{
                newsObj.getNews()
            }
        }
    }
}



struct FontSize {
    let title       : Font = .title3
    let description : Font = .footnote
    let subDescription : Font = .caption
}
