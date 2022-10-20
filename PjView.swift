//
//  PjView.swift
//  flutter
//
//  Created by Catalina Hermoso on 14/10/2022.
//

import SwiftUI

struct PjView: View {
    var body: some View {
        ZStack {
            Image("stars")
            VStack {
                Text("Name Character")
                    .font(.largeTitle)
                    .foregroundColor(.white)
                VStack (alignment: .leading) {
                    Text("birth year: 2001")
                        .foregroundColor(.white)
                        .font(.body)
                    Text("eye color: green")
                        .foregroundColor(.white)
                        .font(.body)
                    Text("gender: female")
                        .foregroundColor(.white)
                        .font(.body)
                    Text("hair color: yellow")
                        .foregroundColor(.white)
                        .font(.body)
                    Text("height: 170cm")
                        .foregroundColor(.white)
                        .font(.body)
                    Text("homeworld: earth")
                        .foregroundColor(.white)
                        .font(.body)
                    Text("mass: 55kg")
                        .foregroundColor(.white)
                        .font(.body)
                    Text("starships: cantelupe, flutter")
                        .foregroundColor(.white)
                        .font(.body)
                    Text("vehicles: none")
                        .foregroundColor(.white)
                        
                }
            }
        }
        .background(LinearGradient(gradient: Gradient(colors: [Color("darkBlue"), .black]), startPoint: .top, endPoint: .bottom))
    }
}

struct PjView_Previews: PreviewProvider {
    static var previews: some View {
        PjView()
    }
}
