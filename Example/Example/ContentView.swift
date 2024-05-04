//
//  ContentView.swift
//  Example
//
//  Created by Simon Zwicker on 04.05.24.
//

import SwiftUI
import SwiftChameleon

struct ContentView: View {
    
    @State var active: Bool = false
    
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .if(active) { view in
                    view
                        .font(.largeTitle)
                } else: { view in
                    view.font(.footnote)
                }


            Image(systemName: "globe")
                .if(active) { view in
                    view
                        .foregroundStyle(.blue)
                        .font(.title3)
                }
            
            
            Text("Toggle")
                .button {
                    print("I am a button")
                    active.toggle()
                }
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
