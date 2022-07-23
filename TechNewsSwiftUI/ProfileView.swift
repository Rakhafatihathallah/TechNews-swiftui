//
//  ProfileView.swift
//  TechNewsSwiftUI
//
//  Created by Rakha Fatih Athallah on 14/07/22.
//

import SwiftUI

struct ProfileView: View {
    var body: some View {
        VStack(spacing: 25){
            
            Image("Rakha1")
                .resizable()
                .frame(width: 100, height: 100)
                .clipShape(Circle())
            
           Text("Rakha Fatih Athallah")
                .font(.title3)
            HStack(spacing: 20){
                
                Link(destination: URL(string: "https://github.com/Rakhafatihathallah")!) {
                    VStack(spacing: 5){
                        Image("github")
                            .resizable()
                            .frame(width: 50, height: 50)
                        Text("Github")
                            .font(.footnote)
                            .fontWeight(.medium)
                    }
                    
                }.padding()
                Link(destination: URL(string: "https://www.instagram.com/rakha.fatih/")!) {
                    VStack(spacing: 5){
                        Image("instagram")
                            .resizable()
                            .frame(width: 50, height: 50)
                        Text("Instagram")
                            .font(.footnote)
                            .fontWeight(.medium)
                    }
                    
                }.padding()
                Link(destination: URL(string: "https://www.linkedin.com/in/rakha-fatih-0436ab212/")!) {
                    VStack(spacing: 5){
                        Image("linkedin-logo")
                            .resizable()
                            .frame(width: 50, height: 50)
                        Text("LinkedIn")
                            .font(.footnote)
                            .fontWeight(.medium)
                    }
                    
                }.padding()
            }
            Spacer()
        }.padding()
       
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
