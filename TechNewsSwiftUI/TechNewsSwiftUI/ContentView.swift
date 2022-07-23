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
        var body: some View {
            let jsonData = newsObj.newsModel
            let response = jsonData
            
            List(response?.articles ?? [], id:\.self){ news in
                let url = URL(string: news.urlToImage ?? "")
                NavigationLink {
                    DetailView(nameImage: news.urlToImage ?? "", nameTitle: news.titles, nameAuthor: news.author ?? "", nameContent: news.content, nameURL: news.urls, namePublished: news.publishedAt)
                } label: {
                    VStack(alignment: .leading){
                        HStack{
                            
                            AsyncImage(url: url) { Image in
                                Image
                                    .resizable()
                                    .frame(width: 110, height: 90)
                                    .scaledToFill()
                                   
                                
                                
                            } placeholder: {
                                ZStack{
                                    Rectangle()
                                        .frame(width: 110, height: 90)
                                        .foregroundColor(.gray)
                                    
                                    ProgressView()
                                        .progressViewStyle(CircularProgressViewStyle())
                                    
                                }
                            }
                            VStack(alignment: .leading){

                                Text(news.titles)
                                    .fontWeight(.bold)
                                    .font(.system(size: 12))
                                

                                Text(news.description)
                                    .font(.footnote)
                                    .lineLimit(2)
                                    .multilineTextAlignment(.leading)
                            }.padding()
                        }
                    }
                }
            }.onAppear{
                newsObj.getNews()
            }
        }
    }
}
