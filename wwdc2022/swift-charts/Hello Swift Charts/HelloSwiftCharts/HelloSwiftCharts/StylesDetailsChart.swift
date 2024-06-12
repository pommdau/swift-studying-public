//
//  StylesDetailsChart.swift
//  HelloSwiftCharts
//
//  Created by HIROKI IKEUCHI on 2022/11/26.
//

import SwiftUI
import Charts

struct Pancakes: Identifiable {
    let name: String
    let sales: Int
    
    var id: String { name }
}

let sales: [Pancakes] = [
    .init(name: "Cachapa", sales: 916),
    .init(name: "Injera", sales: 850),
    .init(name: "Crepe", sales: 802),
    .init(name: "Jian Bing", sales: 753),
    .init(name: "Dosa", sales: 654),
    .init(name: "American", sales: 618),
]

struct StylesDetailsChart: View {
    var body: some View {
        Chart(sales) { sale in
            BarMark(
                x: .value("Sales", sale.sales),
                y: .value("Name", sale.name)
            )
        }
    }
}

struct StylesDetailsChart_Previews: PreviewProvider {
    static var previews: some View {
        StylesDetailsChart()
            .frame(height: 400)
    }
}
