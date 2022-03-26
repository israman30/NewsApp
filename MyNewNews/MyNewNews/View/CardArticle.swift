//
//  CardArticle.swift
//  MyNewNews
//
//  Created by Israel Manzo on 3/26/22.
//  Copyright © 2022 Israel Manzo. All rights reserved.
//

import SwiftUI

struct CardArticle: View {
    
    let article: ArticlesViewModel
    
    var body: some View {
        VStack {
            Image("placeholder")
                .resizable()
                .aspectRatio(contentMode: .fit)
            
            VStack(alignment: .leading) {
                Text(article.title)
                    .font(.title)
                    .fontWeight(.black)
                    .foregroundColor(.primary)
                    .lineLimit(3)
                Text(article.description)
                    .font(.caption)
                    .foregroundColor(.primary)
                
                HStack {
                    Spacer()
                    Text(article.publishedAt)
                        .font(.caption)
                        .foregroundColor(.secondary)
                }
            }
            .padding()
            
        }
        .cornerRadius(10)
        .overlay(
            RoundedRectangle(cornerRadius: 10)
                .stroke(Color(red: 150/255, green: 150/255, blue: 150/255), lineWidth: 1)
        )
        .padding([.top, .horizontal])
    }
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        CardArticle(article: ArticlesViewModel(article: ModelArticles(title: "Title here", description: "Description here", url: "", urlToImage: "", publishedAt: "12/10/22")))
    }
}
