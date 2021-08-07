//
//  Home.swift
//  ecommerce
//
//  Created by Mauro Canhao on 20/07/21.
//

import SwiftUI

struct Home: View {
    @State var selected = tabs[0]
    @Namespace var animation
    
    @State var show = false
    @State var selectedItem : Item = items[0]
    
    var body: some View {
        ZStack{
            VStack{
                HStack{
                    
                    Button(action: {}, label: {
                        Image(systemName: "line.horizontal.3.decrease")
                            .font(.system(size: 25, weight: .heavy))
                            .foregroundColor(.black)
                    })
                    
                    Spacer(minLength: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/)
                    
                    Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                        Image(systemName: "magnifyingglass")
                            .font(.system(size: 25))
                            .foregroundColor(.black)
                    })
                    
                    Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                        Image(systemName: "bag")
                            .font(.system(size: 25))
                            .foregroundColor(.black)
                    })
                }
                .padding(.vertical, 10)
                .padding(.horizontal)
                
                ScrollView{
                    VStack{
                        HStack{
                            VStack(alignment: .leading, spacing: 5){
                                
                                Text("Choose")
                                    .font(.title)
                                    .foregroundColor(.black)
                                
                                Text("Your Album")
                                    .font(.largeTitle)
                                    .fontWeight(.heavy)
                                    .foregroundColor(.black)
                            }
                            .padding(.horizontal)
                            
                            Spacer(minLength: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/)
                        }
                        
                        HStack(spacing: 0){
                            ForEach(tabs, id: \.self){tab in
                                TabButton(title: tab, selected: $selected, animation: animation)
                                
                                if tabs.last != tab{
                                    Spacer(minLength: 0)
                                }
                            }
                        }
                        .padding()
                        .padding(.top, 5)
                        
                        LazyVGrid(columns: Array(repeating: GridItem(.flexible(), spacing: 20), count: 2), spacing: 25){
                            
                            ForEach(items){item in
                                CardView(item: item, animation: animation, heartName: item.liked ? "suit.heart.fill" : "suit.heart")
                                    .onTapGesture {
                                        withAnimation(.spring()){
                                            selectedItem = item
                                            show.toggle()
                                        }
                                    }
                            }
                        }
                        .padding()
                    }
                }
                
                Spacer(minLength: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/)
            }
            .opacity(show ? 0 : 1)
            
            if show{
                
                Detail(selectedItem: selectedItem, show: $show, animation: animation)
            }

        }
        .background(Color.white.ignoresSafeArea())
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}

var tabs = ["New", "Hot", "Wishlist","Recommended"]
