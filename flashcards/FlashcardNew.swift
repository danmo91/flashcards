//
//  FlashcardNew.swift
//  flashcards
//
//  Created by Dan Morain on 6/8/23.
//

import SwiftUI

struct FlashcardNew: View {
    var onSave: (FlashcardNewInput) -> Void

    @State private var title: String = ""
    @State private var description: String = ""
    
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    var body: some View {
        VStack {
            VStack {
                VStack {
                    TextField("Front", text: $title)
                        .textFieldStyle(PrimaryTextFieldStyle())

                    TextField("Back", text: $description, axis: .vertical)
                        .textFieldStyle(PrimaryTextFieldStyle())
                        .lineLimit(2...10)
                }.padding()
            }.background(Color.white)
            .cornerRadius(8.0)
                
                        
            Spacer()
        }.navigationBarTitle(Text("New Flashcard"), displayMode: .inline)
        .navigationBarItems(trailing: Button("Done") {
            onSave(FlashcardNewInput(title: title, description: description))
            self.presentationMode.wrappedValue.dismiss()
        })
        .padding()
        .background(Color.backgroundPrimary)
    }
}

struct PrimaryTextFieldStyle: TextFieldStyle {
    func _body(configuration: TextField<Self._Label>) -> some View {
        configuration
            .padding(10)
            .background(Color.textFieldBackground)
            .cornerRadius(8)
            .fontWeight(.semibold)
            .font(.title3)
            .autocorrectionDisabled()
    }
}

struct FlashcardNewInput {
    var title : String
    var description : String
}

struct ClearableTextField: View {
    var title: String
    @Binding var text: String

    init(_ title: String, text: Binding<String>) {
        self.title = title
        _text = text
    }

    var body: some View {
        ZStack(alignment: .trailing) {
            TextField(title, text: $text)
            
            if !text.isEmpty {
                Image(systemName: "xmark.circle.fill")
                .foregroundColor(.secondary)
                .padding(.trailing, 8)
                .onTapGesture {
                    text = ""
                }
            }
            
        }.padding(.vertical, 4)
    }
}

struct FlashcardNew_Previews: PreviewProvider {
    static func onSave(input: FlashcardNewInput) {
        print("Saving: \(input.title), \(input.description)")
    }
    
    static var previews: some View {
//        FlashcardNew(onSave: onSave)
        NavigationView {
            FlashcardNew(onSave: onSave)
        }
    }
}
