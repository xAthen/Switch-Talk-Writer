//
//  ContentView.swift
//
//
//  Created by Xandra Cornelius on 9/25/26.
//

import SwiftUI

struct ContentView: View {
    
    @Environment(\.dismiss) private var dismiss
    
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
                    VStack {
                        HStack {
                            //row 1
                            Button("A") {
                                words.append(wordBank[0][0])
                            }.padding().background(RoundedRectangle(cornerRadius: 10).stroke(Color .black, lineWidth: 3))
                            Spacer()
                            Button("B") {
                                words.append(wordBank[0][1])
                            }.padding().background(RoundedRectangle(cornerRadius: 10).stroke(Color .black, lineWidth: 3))
                            Spacer()
                            Button("C") {
                                words.append(wordBank[0][2])
                            }.padding().background(RoundedRectangle(cornerRadius: 10).stroke(Color .black, lineWidth: 3))
                            Spacer()
                            Button("D") {
                                words.append(wordBank[0][3])
                            }.padding().background(RoundedRectangle(cornerRadius: 10).stroke(Color .black, lineWidth: 3))
                            Spacer()
                            Button("E") {
                                words.append(wordBank[0][4])
                            }.padding().background(RoundedRectangle(cornerRadius: 10).stroke(Color .black, lineWidth: 3))
                        }
                        Spacer()
                        HStack {
                            //row 2
                            Button("F") {
                                words.append(wordBank[1][0])
                            }.padding().background(RoundedRectangle(cornerRadius: 10).stroke(Color .black, lineWidth: 3))
                            Spacer()
                            Button("G") {
                                words.append(wordBank[1][1])
                            }.padding().background(RoundedRectangle(cornerRadius: 10).stroke(Color .black, lineWidth: 3))
                            Spacer()
                            Button("H") {
                                words.append(wordBank[1][2])
                            }.padding().background(RoundedRectangle(cornerRadius: 10).stroke(Color .black, lineWidth: 3))
                            Spacer()
                            Button("I") {
                                words.append(wordBank[1][3])
                            }.padding().background(RoundedRectangle(cornerRadius: 10).stroke(Color .black, lineWidth: 3))
                            Spacer()
                            Button("J") {
                                words.append(wordBank[1][4])
                            }.padding().background(RoundedRectangle(cornerRadius: 10).stroke(Color .black, lineWidth: 3))
                        }
                        Spacer()
                        HStack {
                            //row 3
                            Button("K") {
                                words.append(wordBank[2][0])
                            }.padding().background(RoundedRectangle(cornerRadius: 10).stroke(Color .black, lineWidth: 3))
                            Spacer()
                            Button("L") {
                                words.append(wordBank[2][1])
                            }.padding().background(RoundedRectangle(cornerRadius: 10).stroke(Color .black, lineWidth: 3))
                            Spacer()
                            Button("M") {
                                words.append(wordBank[2][2])
                            }.padding().background(RoundedRectangle(cornerRadius: 10).stroke(Color .black, lineWidth: 3))
                            Spacer()
                            Button("N") {
                                words.append(wordBank[2][3])
                            }.padding().background(RoundedRectangle(cornerRadius: 10).stroke(Color .black, lineWidth: 3))
                            Spacer()
                            Button("O") {
                                words.append(wordBank[2][4])
                            }.padding().background(RoundedRectangle(cornerRadius: 10).stroke(Color .black, lineWidth: 3))
                        }
                        Spacer()
                        HStack {
                            //row 4
                            Button("P") {
                                words.append(wordBank[3][0])
                            }.padding().background(RoundedRectangle(cornerRadius: 10).stroke(Color .black, lineWidth: 3))
                            Spacer()
                            Button("Q") {
                                words.append(wordBank[3][1])
                            }.padding().background(RoundedRectangle(cornerRadius: 10).stroke(Color .black, lineWidth: 3))
                            Spacer()
                            Button("R") {
                                words.append(wordBank[3][2])
                            }.padding().background(RoundedRectangle(cornerRadius: 10).stroke(Color .black, lineWidth: 3))
                            Spacer()
                            Button("S") {
                                words.append(wordBank[3][3])
                            }.padding().background(RoundedRectangle(cornerRadius: 10).stroke(Color .black, lineWidth: 3))
                            Spacer()
                            Button("T") {
                                words.append(wordBank[3][4])
                            }.padding().background(RoundedRectangle(cornerRadius: 10).stroke(Color .black, lineWidth: 3))
                        }
                        Spacer()
                        HStack {
                            //row 5
                            Button("U") {
                                words.append(wordBank[4][0])
                            }.padding().background(RoundedRectangle(cornerRadius: 10).stroke(Color .black, lineWidth: 3))
                            
                            Button("V") {
                                words.append(wordBank[4][1])
                            }.padding().background(RoundedRectangle(cornerRadius: 10).stroke(Color .black, lineWidth: 3))
                            
                            Button("W") {
                                words.append(wordBank[4][2])
                            }.padding().background(RoundedRectangle(cornerRadius: 10).stroke(Color .black, lineWidth: 3))
                            
                            Button("X") {
                                words.append(wordBank[4][3])
                            }.padding().background(RoundedRectangle(cornerRadius: 10).stroke(Color .black, lineWidth: 3))
                            
                            Button(".") {
                                words.append(wordBank[4][4])
                            }.padding().background(RoundedRectangle(cornerRadius: 10).stroke(Color .black, lineWidth: 3))
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
                    /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Action@*/ /*@END_MENU_TOKEN@*/
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
