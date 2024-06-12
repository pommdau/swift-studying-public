//
//  LocationsToggleChart.swift
//  HelloSwiftCharts
//
//  Created by HIROKI IKEUCHI on 2022/11/26.
//

import SwiftUI
import Charts

enum City {
    case cupertino
    case sanFrancisco
}

let sfData: [SalesSummary] = [
    .init(weekday: date(2022, 5, 2), sales: 81),
    .init(weekday: date(2022, 5, 3), sales: 90),
    .init(weekday: date(2022, 5, 4), sales: 52),
    .init(weekday: date(2022, 5, 5), sales: 72),
    .init(weekday: date(2022, 5, 6), sales: 84),
    .init(weekday: date(2022, 5, 7), sales: 84),
    .init(weekday: date(2022, 5, 8), sales: 137),
]

struct LocationsToggleChart: View {
    @State var city: City = .cupertino
    
    var data: [SalesSummary] {
        switch city {
        case .cupertino:
            return cupertinoData
        case .sanFrancisco:
            return sfData
        }
    }
            
    var body: some View {
        VStack {
            Picker("Ciry", selection: $city.animation(.easeInOut)) {
                Text("Cupertino").tag(City.cupertino)
                Text("San Francisco").tag(City.sanFrancisco)
            }
            .pickerStyle(.segmented)
            
            Chart(data) { element in
                BarMark(
                    x: .value("Day", element.weekday, unit: .day),
                    y: .value("Sales", element.sales)
                )
            }
        }                
    }
}

struct LocationsToggleChart_Previews: PreviewProvider {
    static var previews: some View {
        LocationsToggleChart()
            .frame(height: 400)
    }
}
