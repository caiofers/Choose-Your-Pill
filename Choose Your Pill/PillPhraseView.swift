//
//  PillPhraseView.swift
//  Choose Your Pill
//
//  Created by Caio Fernandes on 20/06/21.
//

import SwiftUI
import CoreData

struct PillPhraseView: View {
    @Environment(\.managedObjectContext) private var viewContext
    @FetchRequest(
        sortDescriptors: [],
        animation: .default)
    
    private var phrases: FetchedResults<Phrase>
    
    var pillView: PillView?
    var tintColor: Color? = nil
    
    var chooseYourPillText: some View {
        Text("You chose the ")
            + Text("\(tintColor?.description ?? "") pill")
            .foregroundColor(tintColor)
    }
    
    var phraseText: some View {
        Text(pickOne())
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
    
    func add(phrase: String, pill: PillType, completion: ((Bool) -> Void)? = nil) {
        let newPhrase = Phrase(context: viewContext)
        newPhrase.phrase = phrase
        newPhrase.pillType = pill
        
        do {
            try viewContext.save()
            print("Phrase saved.")
            completion?(true)
        } catch {
            print(error.localizedDescription)
            completion?(false)
        }
    }
    
    func updateShownState(phrase: Phrase, completion: ((Bool) -> Void)? = nil) {
        viewContext.performAndWait {
            phrase.shown = true
            do {
                try viewContext.save()
                print("Phrase saved.")
                completion?(true)
            } catch {
                print(error.localizedDescription)
                completion?(false)
            }
        }
    }
    
    func pickOne() -> String {
        let phrasesNotShown = phrases.filter { !$0.shown && $0.pill == tintColor?.description }
        
        if phrasesNotShown.isEmpty {
            return "No more phrases today!"
        }
        
        let phraseIndex =  Int(arc4random_uniform(UInt32(phrasesNotShown.count)))
        updateShownState(phrase: phrasesNotShown[phraseIndex])
        return phrasesNotShown[phraseIndex].phrase ?? ""
    }
}

struct PillPhraseView_Previews: PreviewProvider {
    static var previews: some View {
        PillPhraseView().environment(\.managedObjectContext, PersistenceManager.preview.container.viewContext)
    }
}
