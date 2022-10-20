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
            
            //LIST CHARACTERS
            api()
            
            //TOOLBAR BOTTOM
            HStack {
                Text("")
                    .toolbar {
                        ToolbarItem(placement: .bottomBar) {
                            if numPage != 1 {
                                Button("<- Previous") {
                                    page.removeLast()
                                    numPage = numPage-1
                                    page = page+"\(numPage)"
                                    print(page)
                                }
                            }
                        }
                    }
                Spacer()
                Text("")
                    .toolbar {
                        ToolbarItem(placement: .bottomBar) {
                            if numPage != 9 {
                                Button("Next ->") {
                                    page.removeLast()
                                    numPage = numPage+1
                                    page = page+"\(numPage)"
                                    print(page)
                                }
                            }
                        }
                    }
            }
        }
    }
}

struct api: View {
    @StateObject var viewModel = ViewModel()

    var body: some View {
        NavigationView {
            List {
                ForEach(viewModel.characters, id: \.self) { pj in
                    VStack {
                        Text(pj.name)
                            .font(.headline)
                        Text(pj.gender)
                            .font(.body)
                    }
                }

            } .navigationTitle("Characters")
                .onAppear {
                    viewModel.fetchData()
                }
        }
    }
}
    
//    func loadData() async {
//        guard let url = URL(string: page) else {
//            print("Invalid URL")
//            return
//        }
//
//        do {
//            let (data, _) = try await URLSession.shared.data(from: url)
//
//            if let decodedResponse =  try? JSONDecoder().decode([Character].self, from: data) {
//                results = decodedResponse
//            }
//        } catch {
//            print("The data is invalid")
//        }
//    }
//}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(page: api().viewModel.$page)
    }
}
