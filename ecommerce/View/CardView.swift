//
//  CardView.swift
//  ecommerce
//
//  Created by Mauro Canhao on 20/07/21.
//

import SwiftUI

struct CardView: View {
    @State var item: Item
    var animation: Namespace.ID
    
    @State var heartName: String
    
    public func getHeartName() -> String {
        return heartName
    }
    
    var body: some View {

        VStack{
            HStack{
                
                Spacer()
                Text(item.price)
                    .fontWeight(.heavy)
                    .foregroundColor(.black)
                    .padding(.vertical, 8)
                    .padding(.horizontal, 10)
                    .background(Color.white.opacity(0.5))
                    .cornerRadius(10)
            }
            
            Image(item.image)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .matchedGeometryEffect(id: "image\(item.id)", in: animation)
                .padding(.top)
                .padding(.bottom)
                .padding(.horizontal, 10)
            
            
            Text(item.title)
                .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                .foregroundColor(.black)
            
            Text(item.subTitle)
                .font(.caption)
                .foregroundColor(.black)
                .opacity(0.5)
            
            HStack{
                Button(action: {
                    if item.liked == false{
                        heartName = "suit.heart.fill"
                        for i in 0...items.count-1 {
                            if items[i].id == item.id{
                                items[i].liked = true
                                item.liked = true
                            }
                        }
                    } else {
                        heartName = "suit.heart"
                        for i in 0...items.count-1 {
                            if items[i].id == item.id{
                                items[i].liked = false
                                item.liked = false
                            }
                        }
                    }
                }){
                    Image(systemName: heartName)
                        .font(.title2)
                        .foregroundColor(.black)
                }
                .matchedGeometryEffect(id: "heart\(item.id)", in: animation)
                
                Spacer()
                
                Text(item.rating)
                    .fontWeight(.heavy)
                    .foregroundColor(.black)
                    .matchedGeometryEffect(id: "rating\(item.id)", in: animation)
            }
            .padding()
        }
        .background(Color(item.image)
                        .matchedGeometryEffect(id: "color\(item.id)", in: animation)
        )
        .cornerRadius(15)
    }
}

