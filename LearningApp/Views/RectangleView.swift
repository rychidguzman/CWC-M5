//
//  RectangleView.swift
//  LearningApp
//
//  Created by Ryan Christian De Guzman on 12/1/21.
//

import SwiftUI

struct RectangleView: View {
    var color:Color = Color.white
    var body: some View {
        Rectangle()
            .foregroundColor(color)
            .cornerRadius(10)
            .shadow(radius: 5)
    }
}

struct RectangleView_Previews: PreviewProvider {
    static var previews: some View {
        RectangleView()
    }
}
