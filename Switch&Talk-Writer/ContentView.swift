//
//  ContentView.swift
//
//
//  Created by Xandra Cornelius on 9/25/26.
//

import SwiftUI

struct ContentView: View {
    
    @Environment(\.dismiss) private var dismiss
    @State private var isEditable: Bool  = false
    @State private var bWidth: CGFloat = 100
    @State private var bHeight: CGFloat = 70
    @State private var rI: Int = 0
    @State private var cI: Int = 0
    @State private var words = ["Students", "Type", "Here...", "\n", "school"]
    @State private var wordBank: [[String]] = [
        ["A", "B", "C", "D", "E"],
        ["F", "G", "H", "I", "J"],
        ["K", "L", "M", "N", "O"],
        ["P", "Q", "R", "S", "T"],
        ["U", "V", "W", "X", ".\n"]
    ]
    var body: some View {
        
        //Image("beta-sketch").resizable().cornerRadius(10.0).aspectRatio(contentMode: .fill).padding()
        
        HStack {
            //Student View
            VStack {
                //Textbox
                ScrollView {
                    Text(words.joined(separator: " ")).frame(alignment: .leading)
                }.padding().frame(height: 200, alignment: .leading)
                Spacer()
                //buttons
                HStack {
                    //letters
                    ZStack {
                        if !isEditable {
                            VStack (spacing: 10) {
                                ForEach(0..<wordBank.count, id: \.self) { rI in
                                    HStack (spacing: 10) {
                                        ForEach(0..<wordBank[rI].count, id: \.self) { cI in
                                            Button(action: {
                                                words.append(wordBank[rI][cI])
                                            }) {
                                                Text(wordBank[rI][cI])
                                                    .frame(width: bWidth, height: bHeight)
                                                    .background(RoundedRectangle(cornerRadius: 10).stroke(Color .black, lineWidth: 3)).frame(width: bWidth, height: bHeight)
                                            }
                                        }
                                        
                                        
                                    }
                                }
                                
                            }
                        } else {
                            VStack (spacing: 10) {
                                ForEach(0..<wordBank.count, id: \.self) { rI in
                                    HStack (spacing: 10) {
                                        ForEach(0..<wordBank[rI].count, id: \.self) { cI in
                                            TextField(wordBank[rI][cI], text: $wordBank[rI][cI])
                                            .frame(width: bWidth, height: bHeight)
                                            .background(RoundedRectangle(cornerRadius: 10).stroke(Color .black, lineWidth: 3))
                                        }

                                        
                                    }
                                }
                            }
                        }
                    }.padding()
                    //settings
                    VStack {
                        Button("Delete") {
                            if !words.isEmpty {words.removeLast()}
                        }.padding().background(RoundedRectangle(cornerRadius: 10).stroke(Color .black, lineWidth: 3))
                        Spacer()
                        Button("Read All") {
                            /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Action@*/ /*@END_MENU_TOKEN@*/
                        }.padding().background(RoundedRectangle(cornerRadius: 10).stroke(Color .black, lineWidth: 3))
                        Spacer()
                        Button("Full Screen") {
                            /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Action@*/ /*@END_MENU_TOKEN@*/
                        }.padding().background(RoundedRectangle(cornerRadius: 10).stroke(Color .black, lineWidth: 3))
                    }.padding()
                    
                }
                
            }
            //Teacher View
            VStack {
                Button("Settings") {
                    /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Action@*/ /*@END_MENU_TOKEN@*/
                }.padding().background(Color .gray).cornerRadius(10).foregroundColor(.white)
                Spacer()
                Button("Teacher Mode") {
                    isEditable.toggle()
                }.padding().background(Color .gray).cornerRadius(10).foregroundColor(.white)
                Spacer()
                Button("Save") {
                    /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Action@*/ /*@END_MENU_TOKEN@*/
                }.padding().background(Color .gray).cornerRadius(10).foregroundColor(.white)
                Spacer()
                Button("Back") {
                    dismiss()
                }.padding().background(Color .gray).cornerRadius(10).foregroundColor(.white)
                Spacer()
                Button(action: {},
                    label: {
                        Text("Home")
                        
                }).padding().background(Color .gray).cornerRadius(10).foregroundColor(.white)
            }
        }
            //.buttonStyle(.borderedProminent)
            //.tint(.green)
        .font(Font.system(size: 40))
            .accessibilityLabel("Settings")
            .navigationBarBackButtonHidden(true)
    }
}

struct ContentView_Previews:
    PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
