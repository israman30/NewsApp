//
//  CardView.swift
//  MyNewNews
//
//  Created by Israel Manzo on 3/25/22.
//  Copyright © 2022 Israel Manzo. All rights reserved.
//

import SwiftUI

protocol CardContent {
    var imageName: String { get }
    var title: String { get }
    var description: String { get }
}

typealias Content = CardContent

struct CardView: View {
    
//    @State var vm: ArticlesViewModel?
    let title: String?
    let description: String?
    let publishedAt: String?
    
    var body: some View {
        VStack {
            Image("placeholder")
                .resizable()
                .aspectRatio(contentMode: .fit)
            
            VStack(alignment: .leading) {
                Text(title ?? "")
                    .font(.title)
                    .fontWeight(.black)
                    .foregroundColor(.primary)
                    .lineLimit(3)
                Text(description ?? "")
                    .font(.caption)
                    .foregroundColor(.primary)
                
                HStack {
                    Spacer()
                    Text(publishedAt ?? "")
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
        CardView(title: "Title", description: "Description", publishedAt: "12/10/21")
    }
}
