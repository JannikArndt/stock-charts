//
//  LineChartView.swift
//  StockCharts
//
//  Created by Dennis Concepción Martín on 30/4/21.
//

import SwiftUI

public struct LineChartView: View {
    public var data: [Double]
    public var dates: [String]?
    public var hours: [String]?
    public var dragGesture: Bool?
    
    @State var showingIndicators = false
    @State var indexPosition = Int()
    
    public init(data: [Double], dates: [String]?, hours: [String]?, dragGesture: Bool?) {
        self.data = data
        self.dates = dates
        self.hours = hours
        self.dragGesture = dragGesture
    }
    
    public var body: some View {
        if !data.isEmpty {
            VStack {
                if dragGesture ?? true {
                    ChartLabel(data: data, dates: dates, hours: hours, indexPosition: $indexPosition)
                        .opacity(showingIndicators ? 1: 0)
                        .padding(.vertical)
                }

                LineView(data: data, dates: dates, hours: hours, dragGesture: dragGesture, showingIndicators: $showingIndicators, indexPosition: $indexPosition)
            }
        }
    }
}
