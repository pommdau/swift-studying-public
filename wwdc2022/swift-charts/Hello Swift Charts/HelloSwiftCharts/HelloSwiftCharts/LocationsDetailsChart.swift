//
//  LocationsDetailsChart.swift
//  HelloSwiftCharts
//
//  Created by HIROKI IKEUCHI on 2022/11/26.
//

import SwiftUI
import Charts

struct Series: Identifiable {
    let ciry: String
    let sales: [SalesSummary]
    
    var id: String { ciry }
}

let seriesData: [Series] = [
    .init(ciry: "Cupertino", sales: cupertinoData),
    .init(ciry: "San Francisco", sales: sfData)
]

struct LocationsDetailsChart: View {
    var body: some View {
        Chart(seriesData) { series in
            ForEach(series.sales) { element in
                LineMark(x: .value("Day", element.weekday, unit: .day) ,
                        y: .value("Sales", element.sales)
                )
                .foregroundStyle(by: .value("City", series.ciry))
                .symbol(by: .value("City", series.ciry))
            }
        }
    }
}

struct LocationsDetailsChart_Previews: PreviewProvider {
    static var previews: some View {
        LocationsDetailsChart()
            .frame(height: 400)
            .padding()
    }
}
