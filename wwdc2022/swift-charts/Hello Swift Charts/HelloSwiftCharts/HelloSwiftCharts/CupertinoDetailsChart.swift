//
//  CupertinoDetailsChart.swift
//  HelloSwiftCharts
//
//  Created by HIROKI IKEUCHI on 2022/11/26.
//

import SwiftUI
import Charts

struct SalesSummary: Identifiable {
    let weekday: Date
    let sales: Int
    
    var id: Date { weekday }
}

let cupertinoData: [SalesSummary] = [
    .init(weekday: date(2022, 5, 2), sales: 54),
    .init(weekday: date(2022, 5, 3), sales: 42),
    .init(weekday: date(2022, 5, 4), sales: 88),
    .init(weekday: date(2022, 5, 5), sales: 49),
    .init(weekday: date(2022, 5, 6), sales: 42),
    .init(weekday: date(2022, 5, 7), sales: 125),
    .init(weekday: date(2022, 5, 8), sales: 67),
]

struct CupertinoDetailsChart: View {
    var body: some View {
        Chart(cupertinoData) { element in
            BarMark(
                x: .value("Day", element.weekday, unit: .day),
                y: .value("Sales", element.sales)
            )
        }
    }
}

struct CupertinoDetailsChart_Previews: PreviewProvider {
    static var previews: some View {
        CupertinoDetailsChart()
            .frame(height: 400)
    }
}

// MARK: - Helpers

func date(_ year: Int,_ month: Int, _ day: Int) -> Date {
    let calendar = Calendar(identifier: .gregorian)
    let date = calendar.date(from: DateComponents(year: year, month: month, day: day, hour: 0, minute: 0, second: 0))!
    return date
}
