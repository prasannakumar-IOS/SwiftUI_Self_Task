////
////  DemoView.swift
////  prasannaSwiftUI
////
////  Created by Prasannakumar Manikandan on 03/02/22.
////
//
//import SwiftUI
//
//struct DemoView: View {
//    @StateObject var pokemonList = DemoViewModel()
//    @State var demoList = ["HI", "Hello1", "Helloo2", "Hellooo3"]
//    var body: some View {
//        NavigationView {
//            List {
////                Text("HI")
////                Text("Hello1")
////                Text("Helloo2")
////                Text("Hellooo3")
////                HStack {
////                    Text("james")
////                    Spacer()
////                    Text("prasanna")
////                }
//
//
////    -------------------------------------------------------------
//
////                ForEach(demoList) { list in
////                    NavigationLink(destination: DemoDisplayView(name: list)) {
////                        Text(list)
////                    }
////                }.onDelete(perform: { index in
////                    self.demoList.remove(atOffsets: index)
////                })
////                    .onMove(perform: {_,_ in })
//
////    ----------------------------------------------------------------
//                Section(header: Text("Name"), footer: Text("Type")) {
//                ForEach(pokemonList.pokemonNameList) { pokemon in
//                    NavigationLink(destination: DemoDisplayView(name: pokemon.name)) {
//                    HStack {
//                        Text(pokemon.name)
//
//                        Spacer()
//                        Text(pokemon.type)
//                            .foregroundColor(pokemon.color)
//                    }
//                    }
//                }.onDelete(perform: {index in
//                    pokemonList.pokemonNameList.remove(atOffsets: index)
//                })
//                    .onMove(perform: {index, index1 in
//
//                    })
//            }
//            }
//            .listStyle(.sidebar)
//            .toolbar { EditButton() }
////            .refreshable {
////                pokemonList.pokemonNameList.append(Pokemon(id: 4, name: "Pikachu2.0", type: "Electric2.0", color: .blue))
////            }
//        }
//    }
//}
//
//struct DemoView_Previews: PreviewProvider {
//    static var previews: some View {
//        DemoView()
//    }
//}
