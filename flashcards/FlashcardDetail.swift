//
//  FlashcardDetail.swift
//  flashcards
//
//  Created by Dan Morain on 6/8/23.
//

import SwiftUI

struct FlashcardDetail: View {
    let flashcard : Flashcard

    @State private var zoomed = false

    var body: some View {
        VStack() {
            Text(flashcard.description)
            .font(zoomed ? .largeTitle : .subheadline)
            .onTapGesture {
                withAnimation(.easeIn(duration: 0.25)) {
                    self.zoomed.toggle()
                }
            }
            
            Spacer()
        }.navigationBarTitle(Text(flashcard.title), displayMode: .inline)
        .frame(maxWidth: .infinity)
    }
}

struct FlashcardDetail_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            FlashcardDetail(flashcard: testFlashcards.first!)
        }
    }
}
