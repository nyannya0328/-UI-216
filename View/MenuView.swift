//
//  MenuView.swift
//  UI-216
//
//  Created by にゃんにゃん丸 on 2021/06/02.
//

import SwiftUI

struct MenuView: View {
    
    @State var selected = "Help"
    @Namespace var animation
    var body: some View {
        VStack{
            
            HStack{
                
                MenuButton(title: "Help", selected: $selected, animation: animation)
                
                MenuButton(title: "Up Loads", selected: $selected, animation: animation)
                
            }
            .padding(.horizontal)
            .padding(.top)
            
            Divider()
                .padding(.top,5)
            
            
            Image("box")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .padding()
            
            
            HStack{
                
                Text("Expert Your Atribute")
                    .font(.callout)
                    .fontWeight(.semibold)
                    .foregroundColor(.white)
                
                Spacer(minLength: 0)
                
                Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                    Image(systemName: "gear")
                       
                        .foregroundColor(.primary)
                })
            
                
                
            }
            .padding(.horizontal)
            Divider()
                .padding(.bottom,5)
            
            
            HStack{
                
                
                Image("p1")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 30, height: 30)
                    .clipShape(Circle())
                
                Text("Girl")
                    .font(.headline)
                    .fontWeight(.semibold)
                
                
                Spacer()
                
                
                
                Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                   Image(systemName: "square.and.arrow.up.fill")
                    .font(.title3)
                    .foregroundColor(.orange)
                })
                .buttonStyle(PlainButtonStyle())
                
                
                
            }
            .padding(.horizontal)
            .padding(.bottom,5)
            
            
            
            
        }
        .frame(width: 250, height: 300)
    }
}

struct MenuView_Previews: PreviewProvider {
    static var previews: some View {
        MenuView()
    }
}

struct MenuButton : View {
    var title : String
    @Binding var selected : String
    var animation : Namespace.ID
    var body: some View{
        
        
        Button(action: {
            
            withAnimation{
                
                
                selected = title
            }
            
        }, label: {
            Text(title)
                .font(.callout)
                .foregroundColor(selected == title ? .white : .primary)
                .frame(maxWidth: .infinity)
                .padding(.vertical,4)
                .background(
                
                    ZStack{
                        
                        if selected == title{
                            
                            
                            RoundedRectangle(cornerRadius: 5)
                                .fill(Color.blue)
                                .matchedGeometryEffect(id: "TAB", in: animation)
                            
                        }
                        else{
                            RoundedRectangle(cornerRadius: 5)
                                .stroke(Color.primary,lineWidth: 2)
                            
                            
                            
                            
                        }
                        
                    }
                
                )
                .contentShape(RoundedRectangle(cornerRadius: 5))
                
        })
        .buttonStyle(PlainButtonStyle())
    
        
    }
}
