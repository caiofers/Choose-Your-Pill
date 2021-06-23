//
//  ContentView.swift
//  Choose Your Pill
//
//  Created by Caio Fernandes on 20/06/21.
//

import SwiftUI

struct PillView: View {
    var pillName: String
    init(pillName: String) {
        self.pillName = pillName
    }
    var textColor = Color("Black Text")
    
    var body: some View {
        VStack {
            Image(pillName)
                .resizable()
                .padding()
                .frame(width: 100.0, height: 100.0)
            Text(pillName)
                .font(.caption2)
                .foregroundColor(textColor)
        }
    }
}

struct ContentView: View {
    var chooseYourPillText: some View = Text("Choose your pill:")
        .padding()
        .font(.title)
    
    var redPillView = PillView(pillName: "Red Pill")
    var bluePillView = PillView(pillName: "Blue Pill")

    var pillExplanationText: some View {
        Text("The ")
            .fontWeight(.bold)
        + Text("red pill")
            .fontWeight(.bold)
            .foregroundColor(.red)
        + Text(" and the ")
            .fontWeight(.bold)
        + Text("blue pill")
            .fontWeight(.bold)
            .foregroundColor(.blue)
        + Text(" represent the choice between ")
            .fontWeight(.bold)
        + Text("embracing the sometimes painful truth")
            .fontWeight(.bold)
            .foregroundColor(.red)
        + Text(" and ")
            .fontWeight(.bold)
        + Text("blessed ignorance")
            .fontWeight(.bold)
            .foregroundColor(.blue)
        + Text(".")
            .fontWeight(.bold)
    }
    
    var body: some View {
        NavigationView {
            VStack {
                chooseYourPillText
                Spacer()
                HStack {
                    Spacer()
                    NavigationLink(
                        destination: PillPhraseView(pillView: redPillView, tintColor: Color.red)) {
                        redPillView
                    }
                    Spacer()
                    NavigationLink(
                        destination: PillPhraseView(pillView: bluePillView, tintColor: Color.blue)) {
                        bluePillView
                    }
                    Spacer()
                }
                Spacer()
                Spacer()
                pillExplanationText
                    .font(.caption)
                    .padding()
                    .multilineTextAlignment(.center)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    
    static var previews: some View {
        ContentView().environment(\.managedObjectContext, PersistenceManager.preview.container.viewContext)
    }
}
