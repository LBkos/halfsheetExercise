//
//  ContentView.swift
//  halfSheet
//
//  Created by Константин Лопаткин on 11.07.2023.
//

import SwiftUI

struct ContentView: View {
    @State var openSheet = false
    @State var sheetText = "Medium Sheet View"
    var body: some View {
        VStack {
            Button("Open Sheet") {
                openSheet.toggle()
            }
            .buttonStyle(.bordered)
        }
        .sheet(isPresented: $openSheet) {
            GeometryReader { geo in
                Text(sheetText)
                    .frame(width: geo.size.width, height: geo.size.height, alignment: .center)
                    .onChange(of: geo.size) { newValue in
                        if geo.size.height > UIScreen.main.bounds.height / 2 {
                            sheetText = "Large Sheet View"
                        } else {
                            sheetText = "Medium Sheet View"
                        }
                    }
            }
            .presentationDetents([.medium, .large])
        }
        
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
