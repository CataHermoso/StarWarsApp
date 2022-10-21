//
//  ContentView.swift
//  flutter
//
//  Created by Catalina Hermoso on 14/10/2022.
//

import SwiftUI

struct ContentView: View {
    @State private var results = [Character]()
    
    @Binding var page: String
    @State private var numPage = 1
    
    var body: some View {
        NavigationView {
            api() //LIST CHARACTERS
                .toolbar {
                    ToolbarItemGroup(placement: .bottomBar) {
                        if numPage != 1 {
                            Button {
                                page.removeLast()
                                numPage = numPage+1
                                page = page+"\(numPage)"
                                print(page)
                            } label: {
                                Image("falcon")
                                    .resizable()
                                    .frame(width: 40.0, height: 30.0)
                                
                            }
                        }
                        else if numPage != 9 {
                            Button {
                                page.removeLast()
                                numPage = numPage+1
                                page = page+"\(numPage)"
                                print(page)
                            } label: {
                                Image("falcon")
                                    .resizable()
                                    .frame(width: 40.0, height: 30.0)
                            }
                        }
                    }
                }
        }
    }
}

struct api: View { //LIST CHARACTERS AND CONNECTION SHEET
    @StateObject var viewModel = ViewModel()
    @State var isSheetPresented = false
    @State private var isConnectionEnabled = true
    
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        List {
            ForEach(viewModel.characters, id: \.self) { pj in
                NavigationLink (destination: PjView()) {
                    HStack {
                        Image(systemName: "person.crop.circle")
                            .font(.system(size: 27))
                            .padding(5)
                            .foregroundColor(Color("darkBlue"))
                        VStack (alignment: .leading) {
                            Text(pj.name)
                                .font(.headline)
                            Text(pj.gender)
                                .font(.body)
                        }
                    }
                }
            }
        }
        .navigationTitle("Characters") //make it white
        .toolbar {
            Button(action: {isSheetPresented=true}) {
                Image(systemName: "antenna.radiowaves.left.and.right")
                    .foregroundColor(.blue) //.yyellow
            }
        }
        .toolbarBackground(.hidden, for: .navigationBar)
        .onAppear {
            viewModel.fetchData()
        }
        .sheet(isPresented: $isSheetPresented) {
            NavigationView {
                ZStack {
                    //Image("starsMoving")
                    if (isConnectionEnabled == true) {
                        VStack {
                            ZStack {
                                Rectangle()
                                    .fill(.white)
                                    .cornerRadius(10)
                                    .frame(height: 90, alignment: .center)
                                VStack (alignment: .center) {
                                    Text("If you disable the connection,")
                                    Text("sightings won't be reported.")
                                        .fontWeight(.bold)
                                }
                            }
                            ZStack {
                                Rectangle()
                                    .fill(.yellow)
                                    .cornerRadius(10)
                                    .frame(width: 300, height: 100, alignment: .center)
                                Button (action: {
                                    isConnectionEnabled=false
                                    isSheetPresented=false
                                    presentationMode.wrappedValue.dismiss()
                                }) {
                                    Image(systemName: "wifi.slash")
                                        .font(.system(size: 40))
                                        .foregroundColor(.black)
                                }
                            }
                        }
                    }
                    else {
                        VStack {
                            ZStack {
                                Rectangle()
                                    .fill(.white)
                                    .cornerRadius(10)
                                    .frame(height: 90, alignment: .center)
                                VStack (alignment: .center) {
                                    Text("If you enable the connection,")
                                    Text("sightings will be reported.")
                                        .fontWeight(.bold)
                                }
                            }
                            ZStack {
                                Rectangle()
                                    .fill(.yellow)
                                    .cornerRadius(10)
                                    .frame(width: 300, height: 100, alignment: .center)
                                Button (action: {
                                    isConnectionEnabled=true
                                    isSheetPresented=false
                                    presentationMode.wrappedValue.dismiss()
                                }) {
                                    Image(systemName: "wifi")
                                        .font(.system(size: 40))
                                        .foregroundColor(.black)
                                }
                            }
                        }
                    }
                }
            }
        }
        //BACKGROUND
        //.background(Image("starsMoving"))
//        .background(ZStack {
//            LinearGradient(gradient: Gradient(colors: [Color("darkBlue"), Color("lightBlue")]), startPoint: .top, endPoint: .bottom)
//            Image("stars")
//        })
//        .scrollContentBackground(.hidden)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(page: api().viewModel.$page)
    }
}
