//
//  HomeViewRow.swift
//  LearningApp
//
//  Created by Ryan Christian De Guzman on 11/17/21.
//

import SwiftUI

struct HomeViewRow: View {
    
    var image:String
    var title:String
    var description:String
    var count:String
    var time:String
    var body: some View {
        ZStack{
            Rectangle()
                .foregroundColor(.white)
                .cornerRadius(10)
                .shadow(radius:15)
                .aspectRatio(CGSize(width: 335, height: 175), contentMode: .fit)
            
            HStack{
                
                Image(image)
                    .resizable()
                    .frame(width: 116, height: 116)
                    .clipShape(Circle())
                Spacer()
                VStack(alignment: .leading, spacing: 10){
                    Text(title)
                        .bold()
                    
                    Text(description)
                        .font(Font.system(size: 10))
                        .padding(.bottom, 20)
                    HStack{
                        
                        //Number of Lessons/questions
                        Image(systemName: "text.book.closed")
                            .resizable()
                            .frame(width: 15, height: 15)
                        Text(count)
                            .font(Font.system(size: 8))
                        //Time
                        Image(systemName: "clock")
                            .resizable()
                            .frame(width: 15, height: 15)
                        Text(time)
                            .font(Font.system(size: 8))
                    }
                }
                .padding(.leading)
                
            }
            .padding(.horizontal, 50)
        }
    }
}

struct HomeViewRow_Previews: PreviewProvider {
    static var previews: some View {
        HomeViewRow(image: "swift", title: "Learning Swift", description: "we have something", count: "1", time: "23 lesson")
    }
}
