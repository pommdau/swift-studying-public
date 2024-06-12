//
//  ContentView.swift
//  HelloSwiftCharts
//
//  Created by HIROKI IKEUCHI on 2022/11/26.
//

import SwiftUI



struct ContentView: View {
    var body: some View {
//        StylesDetailsChart()
//        CupertinoDetailsChart()
//            .frame(maxHeight: 300)
//            .padding()
        
        LocationsToggleChart()
            .frame(maxHeight: 300)
            .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
