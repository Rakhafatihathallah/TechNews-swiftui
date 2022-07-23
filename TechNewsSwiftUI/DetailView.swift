//
//  DetailView.swift
//  TechNewsSwiftUI
//
//  Created by Rakha Fatih Athallah on 14/07/22.
//

import SwiftUI

struct DetailView: View {
    var nameImage : String
    var nameTitle : String
    var nameAuthor : String
    var nameContent : String
    var nameURL : String
    var namePublished : String
    @EnvironmentObject var newsManager : NewsManager
    
    var body: some View {
        ScrollView{
            VStack(spacing: 20){
            let url = URL(string: nameImage)
            
            AsyncImage(url: url) { Image in
                Image
                    .resizable()
                    .frame(width: 350, height: 270)
            } placeholder: {
                ZStack{
                    Rectangle()
                        .foregroundColor(.gray)
                        .frame(width: 350, height: 300)
                    ProgressView()
                        .progressViewStyle(CircularProgressViewStyle())
                        .frame(width: 200, height: 200)
                }
            }
            
            VStack(alignment: .leading,spacing: 20){
                Text(nameTitle)
                    .font(.title3)
                    .fontWeight(.bold)
                
                Text(nameContent)
                    .multilineTextAlignment(.leading)
                
                Text("Author: \(nameAuthor)")
                    .font(.footnote)
                
                Link(destination: URL(string: nameURL)!) {
                    Text("Sumber: \(nameURL)")
                        .font(.footnote)
                        .multilineTextAlignment(.leading)
                }
                
                Text("Published at: \(namePublished)")
                    .font(.footnote)

            }.padding()
        }
    }
   }
}



