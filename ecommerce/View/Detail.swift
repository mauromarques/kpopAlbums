//
//  Detail.swift
//  ecommerce
//
//  Created by Mauro Canhao on 20/07/21.
//

import SwiftUI

struct Detail: View {
    @State var selectedItem: Item
    @Binding var show: Bool
    var animation: Namespace.ID
    @State var loadContent = false
    @State private var selectedVersion: Int = 0
    
    var body: some View {
        VStack{
            HStack(){
                Button(action: {
                    withAnimation(.spring()){
                        show.toggle()
                    }
                }){
                    Image(systemName: "chevron.left")
                        .font(.system(size: 25))
                        .foregroundColor(.black)
                }
                
                Spacer()
                
                Button(action:{}){
                    Image(systemName: "bag")
                        .font(.system(size: 25))
                        .foregroundColor(.black)
                }
            }
            .padding(.horizontal)
            .padding(.vertical, 10)
            
            ScrollView(showsIndicators: false){
                VStack(){
                    Image(selectedItem.versions[selectedVersion].cover)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .matchedGeometryEffect(id: "image\(selectedItem.id)", in: animation)
                        .frame(height:250)
                        .padding(.top, 3)
                        .padding(.bottom, 5)
                        .padding(.horizontal)
                        .shadow(radius: 10)
                    
                    Text(selectedItem.title + " - " + selectedItem.versions[selectedVersion].name)
                        .font(.title3)
                        .fontWeight(.heavy)
                        .foregroundColor(.black)
                    
                    Text(selectedItem.subTitle)
                        .foregroundColor(.black)
                        .opacity(0.5)
                    
                    HStack{
                        
                        Button(action: {}){
                            Image(systemName: selectedItem.liked ? "suit.heart.fill" : "suit.heart")
                                .font(.title2)
                                .foregroundColor(.black)
                        }
                        .matchedGeometryEffect(id: "heart\(selectedItem.id)", in: animation)
                        
                        Spacer()
                        
                        Text(selectedItem.rating)
                            .fontWeight(.heavy)
                            .foregroundColor(.black)
                            .matchedGeometryEffect(id: "rating\(selectedItem.id)", in: animation)
                        
                      
                    }
                    .padding(.bottom)
                    .padding(.top, 10)
                    .padding(.horizontal)
                }
                .padding(.top, 20)
                .background(
                    Color(selectedItem.versions[selectedVersion].cover)
                        .clipShape(CustomShape())
                        .matchedGeometryEffect(id: "color\(selectedItem.id)", in: animation)
                )
                .cornerRadius(15)
                .padding()
                
                VStack{
                    
                    VStack(alignment: .leading, spacing: 10){
                        Text("Versions")
                            .fontWeight(.heavy)
                            .foregroundColor(.black)
                        
                        HStack(spacing: 15){
                            ForEach(0...selectedItem.versions.count-1, id: \.self){version in
                                ZStack{
                                    Image(selectedItem.versions[version].cover)
                                        .resizable()
                                        .aspectRatio(contentMode: .fill)
                                        .clipShape(Circle())
                                        .frame(width: 45, height: 45)
                                        .onTapGesture {
                                            withAnimation{
                                                selectedVersion = version
                                                
                                            }
                                        }
                                    
                                    if selectedVersion == version{
                                        Circle()
                                            .foregroundColor(.white)
                                            .opacity(0.6)
                                            .frame(width: 45, height: 45)
                                        Image(systemName: "checkmark.circle")
                                            .resizable()
                                            .aspectRatio(contentMode: .fill)
                                            .foregroundColor(.black)
                                            .frame(width: 30, height: 30)
                                        
                                    }
                                }
                            }
                            
                            Spacer()
                        }
                        Text("Description:")
                            .fontWeight(.heavy)
                        Text(selectedItem.description)
                            .font(.subheadline)
                            .fontWeight(.regular)
                            .foregroundColor(.secondary)
                    }
                    .padding()
                    
                    Spacer()
                    
                    Button(action: {}){
                        Text("Add to cart - "+selectedItem.price)
                            .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                            .foregroundColor(.black)
                            .padding(.vertical)
                            .frame(width: UIScreen.main.bounds.width - 100)
                            .background(
                                RoundedRectangle(cornerRadius: 15)
                                    .stroke(Color.black, lineWidth: 1)
                            )
                    }
                    
                }
                .padding([.horizontal,.bottom])
                .frame(height: loadContent ? nil : 0, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                .opacity(loadContent ? 1 : 0)
                
                Spacer(minLength: 0)
            }
            
        }
        .onAppear(){
            withAnimation(Animation.spring().delay(0.45)){
                loadContent.toggle()
            }
        }
    }
}
