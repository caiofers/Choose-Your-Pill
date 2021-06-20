//
//  PillPhraseView.swift
//  Choose Your Pill
//
//  Created by Caio Fernandes on 20/06/21.
//

import SwiftUI

struct PillPhraseView: View {
    
    var pillView: PillView?
    var tintColor: Color? = nil
    
    var chooseYourPillText: some View {
        Text("You chose the ")
            + Text("\(tintColor?.description ?? "") pill")
            .foregroundColor(tintColor)
    }
    
    var phraseText: some View {
        Text("O homem que não valoriza a si mesmo, não pode valorizar nada e nem ninguém.")
            .fontWeight(.bold)
            .multilineTextAlignment(.center)
            .foregroundColor(tintColor)
            
    }
    
    var body: some View {
        Spacer()
        VStack {
            chooseYourPillText
                .font(.title)
            Spacer()
            pillView
                .padding()
                .onTapGesture {
                }
            Spacer()
            phraseText
                .padding()
            Spacer()
        }
    }
}

struct PillPhraseView_Previews: PreviewProvider {
    static var previews: some View {
        PillPhraseView()
    }
}
