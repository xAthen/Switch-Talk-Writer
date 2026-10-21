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
    @State private var fullScreen: Bool = false
    @State private var bWidth: CGFloat = 100
    @State private var bHeight: CGFloat = 70
    @State private var scrollHeight: CGFloat = 150
    @State private var space: CGFloat = 10
    @State private var txtSize: CGFloat = 60
    @State private var words = ["Students", "Type", "Here...", "\n", "Example", "Sentences", "Include", ".\n", "Hello", "I", "am", "Xandra", ".\n", "Hello", "I", "am", "George", ".\n", "The", "weather", "is", "nice", ".\n", "School", "was", "good", ".\n"]
    @State private var wordBank: [[String]] = [
        ["Alpha", "Bravo", "Charlie", "Delta", "Echo"],
        ["Foxtrot", "Golf", "Hotel", "India", "Juliet"],
        ["Kilo", "Lima", "Mike", "November", "Oscar"],
        ["Papa", "Quebec", "Romeo", "Sierra", "Tango"],
        ["Uniform", "Victor", "Whiskey", "X-ray", ".\n"]
    ]
    var body: some View {
        //KeyboardNavView {
            GeometryReader { geometry in
                HStack (spacing: 0) {
                    //Student View
                    if !fullScreen {
                        VStack {
                            //Textbox
                            ScrollView (.vertical, showsIndicators: true) {
                                VStack (alignment: .leading){
                                    Text(
                                        words.reduce("") {result, word in
                                            if result.isEmpty {return word}
                                            else if word == ".\n" {return result+word}
                                            else {return result + " " + word}
                                        })
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                }.frame(maxWidth: .infinity, minHeight: 200)
                                    .contentShape(Rectangle())
                            }.accessibilityLabel("Student Text")
                                .padding()
                            //.background(Color.purple)
                                .frame(height: geometry.size.height * 0.2, alignment: .leading)
                            //buttons
                            HStack {
                                //letters
                                ZStack {
                                    if !isEditable {
                                        VStack (spacing: space) {
                                            ForEach(0..<wordBank.count, id: \.self) { rI in
                                                HStack (spacing: space) {
                                                    ForEach(0..<wordBank[rI].count, id: \.self) { cI in
                                                        Button(action: {
                                                            words.append(wordBank[rI][cI])
                                                        }) {
                                                            Text(wordBank[rI][cI])
                                                                .padding(3)
                                                                .multilineTextAlignment(.center)
                                                                .frame(maxWidth: .infinity)
                                                                .frame( height: geometry.size.height * 0.145)
                                                                .background(RoundedRectangle(cornerRadius: 10).stroke(Color .black, lineWidth: 3))
                                                        }.accessibilityLabel("Row \(rI + 1), Column \(cI + 1): \(wordBank[rI][cI])")
                                                    }
                                                }.accessibilityLabel("Row \(rI+1)")
                                            }
                                        }.accessibilityLabel("Student Word Bank")
                                            .padding(.bottom, 5).padding(.leading, 15)
                                    } else {
                                        VStack (spacing: space) {
                                            ForEach(0..<wordBank.count, id: \.self) { rI in
                                                HStack (spacing: space) {
                                                    ForEach(0..<wordBank[rI].count, id: \.self) { cI in
                                                        TextField(wordBank[rI][cI], text: $wordBank[rI][cI])
                                                            .accessibilityLabel("Row \(rI + 1), Column \(cI + 1): \(wordBank[rI][cI])")
                                                            .padding(3)
                                                            .multilineTextAlignment(.center)
                                                            .frame(maxWidth: .infinity)
                                                            .frame( height: geometry.size.height * 0.145)
                                                            .background(RoundedRectangle(cornerRadius: 10)
                                                                .stroke(Color .black, lineWidth: 5)
                                                                .fill(Color(red: 200/255, green: 200/255, blue: 200/255)))
                                                    }
                                                }.accessibilityLabel("Row \(rI+1)")
                                            }
                                        }.accessibilityLabel("Teacher Word Bank")
                                            .padding(.bottom, 5).padding(.leading, 15)
                                    }
                                }
                                .frame(width: geometry.size.width * 0.70).frame(maxHeight: .infinity)
                                .foregroundColor(.black)
                                VStack {    //Student Controls
                                    Button("Delete") {
                                        if !words.isEmpty {words.removeLast()}
                                    }.accessibilityLabel("Delete Word")
                                        .padding()
                                        .multilineTextAlignment(.center)
                                        .frame(maxWidth: .infinity)
                                        .frame( height: geometry.size.height * 0.2)
                                        .background(RoundedRectangle(cornerRadius: 10).stroke(Color .black, lineWidth: 3))
                                    Button("Read All") {
                                        /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Action@*/ /*@END_MENU_TOKEN@*/
                                    }.accessibilityLabel("Read All Student Text")
                                        .padding()
                                        .multilineTextAlignment(.center)
                                        .frame(maxWidth: .infinity)
                                        .frame( height: geometry.size.height * 0.2)
                                        .background(RoundedRectangle(cornerRadius: 10).stroke(Color .black, lineWidth: 3))
                                    Button("Full Screen") {
                                        fullScreen.toggle()
                                    }.accessibilityLabel("Full Screen Student Text")
                                        .padding()
                                        .multilineTextAlignment(.center)
                                        .frame(maxWidth: .infinity)
                                        .frame( height: geometry.size.height * 0.2)
                                        .background(RoundedRectangle(cornerRadius: 10).stroke(Color .black, lineWidth: 3))
                                }.accessibilityLabel("Student Controls")
                                    .frame(width: geometry.size.width * 0.15)
                                    .foregroundColor(.black)
                                    .padding(.leading, 5)
                            }
                        }.frame(width: geometry.size.width * 0.85)
                    } else {
                        ZStack {
                            ScrollView (.vertical, showsIndicators: true) {
                                VStack (alignment: .leading){
                                    Text(//words.joined(separator: " "))
                                        words.reduce("") {result, word in
                                            if result.isEmpty {return word}
                                            else if word == ".\n" {return result+word}
                                            else {return result + " " + word}
                                        })
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                }.frame(maxWidth: .infinity, maxHeight: .infinity)
                                    .contentShape(Rectangle())
                            }.accessibilityLabel("Scroll Student Text")
                            VStack {
                                Button(action: {
                                    fullScreen.toggle()
                                }) {
                                    Text("Full Screen")
                                        .padding()
                                        .multilineTextAlignment(.center)
                                        .frame(maxWidth: geometry.size.width * 0.18)
                                        .frame( height: geometry.size.height * 0.18)
                                        .background(RoundedRectangle(cornerRadius: 10)
                                            .stroke(Color .black, lineWidth: 3))
                                        .foregroundColor(.black)
                                }.accessibilityLabel("Open Student Word Bank")
                                    .padding(.bottom, 16)
                            }.frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottomTrailing)
                        }.accessibilityLabel("Student Text")
                            .padding()
                        
                    }
                    //Teacher View
                    VStack {
                        Button("Settings") {
                            /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Action@*/ /*@END_MENU_TOKEN@*/
                        }.accessibilityLabel("Settings")
                            .padding(5)
                            .multilineTextAlignment(.center)
                            .frame(maxWidth: .infinity)
                            .frame( height: geometry.size.height * 0.18)
                            .background(Color .gray).cornerRadius(10).foregroundColor(.white)
                        Button("Teacher Mode") {
                            isEditable.toggle()
                        }.accessibilityLabel("Toggle Teacher Mode")
                            .padding(5)
                            .multilineTextAlignment(.center)
                            .frame(maxWidth: .infinity)
                            .frame( height: geometry.size.height * 0.18)
                            .background(Color .gray).cornerRadius(10).foregroundColor(.white)
                        Button("Save") {
                            /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Action@*/ /*@END_MENU_TOKEN@*/
                        }.accessibilityLabel("Save")
                            .padding(5)
                            .multilineTextAlignment(.center)
                            .frame(maxWidth: .infinity)
                            .frame( height: geometry.size.height * 0.18)
                            .background(Color .gray).cornerRadius(10).foregroundColor(.white)
                        Button("Back") {
                            dismiss()
                        }.accessibilityLabel("Back")
                            .padding(5)
                            .multilineTextAlignment(.center)
                            .frame(maxWidth: .infinity)
                            .frame( height: geometry.size.height * 0.18)
                            .background(Color .gray).cornerRadius(10).foregroundColor(.white)
                        Button(action: {},
                               label: {
                            Text("Home")
                            
                        }).accessibilityLabel("Home")
                            .padding(5)
                            .multilineTextAlignment(.center)
                            .frame(maxWidth: .infinity)
                            .frame( height: geometry.size.height * 0.18)
                            .background(Color .gray).cornerRadius(10).foregroundColor(.white)
                    }.frame(width: geometry.size.width * 0.135).padding()
                    
                }
                .font(Font.system(size: 80))
                .minimumScaleFactor(0.3)
                
                //.buttonStyle(.borderedProminent)
                //.tint(.green)
                //.accessibilityLabel("Settings")
                //.navigationBarBackButtonHidden(true)
            }.ignoresSafeArea()
        //}
    }
}

/*struct KeyboardNavView<Content: View> View {
    @State private var activeRow = 0
    @State private var activeCol = 0
    @State private var currentSection: AppSection = .wordBank
    
    enum AppSection {
        case studentText, wordBank, studentCommands
        
    }
    
    let content: () -> Content
    
    init(@ViewBuilder content: @escaping () -> Content) {
        self.content = content()
    }
    var body: some View {
        ZStack {
            content()
        }
        .onCommand(#selector(NSResponder.moveRight(_:))) {activeRow += 1}
        .onCommand(#selector(NSResponder.moveLeft(_:))) {activeRow -= 1}
        .onCommand(#selector(NSResponder.moveDown(_:))) {activeCol += 1}
        .onCommand(#selector(NSResponder.moveUp(_:))) {activeCol -= 1}
    }
}
    */
struct ContentView_Previews:
    PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
