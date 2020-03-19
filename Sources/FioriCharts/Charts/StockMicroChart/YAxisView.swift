//
//  YAxisView.swift
//  Micro Charts
//
//  Created by Xu, Sheng on 1/9/20.
//  Copyright © 2020 sstadelman. All rights reserved.
//

import SwiftUI

struct YAxisView: View {
    @EnvironmentObject var model: ChartModel
    @Environment(\.colorScheme) var colorScheme
    
    var rect: CGRect
    var chartWidth: CGFloat
    
    var body: some View {
        let minVal = CGFloat(model.ranges?[model.currentSeriesIndex].lowerBound ?? 0)
        let maxVal = CGFloat(model.ranges?[model.currentSeriesIndex].upperBound ?? 0)
        
        let yAxisLabelsCount = max(1, model.numberOfGridlines)
        let count = yAxisLabelsCount + 1
        var yAxisLabels: [AxisTitle] = [AxisTitle(index: 0, title: formatYAxisTitle(value: maxVal, total: count))]
        
        if yAxisLabelsCount > 1 {
            for i in 1..<yAxisLabelsCount {
                let val = maxVal - CGFloat(i) * (maxVal - minVal) / CGFloat(yAxisLabelsCount + 1)
                yAxisLabels.append(AxisTitle(index: i, title: formatYAxisTitle(value: val, total: count)))
            }
        }

        let startValTitle = formatYAxisTitle(value: minVal, total: count)
        
        let x = rect.origin.x + rect.size.width
        let stepHeight = self.rect.size.height / CGFloat(yAxisLabelsCount)
        
        return ZStack {
            if !model.numericAxis.labels.isHidden || !model.numericAxis.gridlines.isHidden {
                ForEach(yAxisLabels) { label in
                    if !self.model.numericAxis.labels.isHidden {
                        // y axis lables
                        Text(label.title)
                            .font(.system(size: CGFloat(self.model.numericAxis.labels.fontSize)))
                            .foregroundColor(self.model.numericAxis.labels.color.color(self.colorScheme))
                            .position(x: self.rect.origin.x + self.rect.size.width / 2,
                                      y: self.rect.origin.y + CGFloat(label.index) * stepHeight)
                    }
                    
                    if !self.model.numericAxis.gridlines.isHidden {
                        // grid lines
                        LineShape(pos1: CGPoint(x: x, y: self.rect.origin.y + CGFloat(label.index) * stepHeight),
                                  pos2: CGPoint(x: x + self.chartWidth, y: self.rect.origin.y + CGFloat(label.index) * stepHeight))
                            .stroke(self.model.numericAxis.gridlines.color.color(self.colorScheme),
                                    style: StrokeStyle(lineWidth: CGFloat(self.model.numericAxis.gridlines.width),
                                                       dash: [CGFloat(self.model.numericAxis.gridlines.dashPatternLength), CGFloat(self.model.numericAxis.gridlines.dashPatternGap)]))
                    }
                }
            }
            
            // start value label
            if !self.model.numericAxis.labels.isHidden {
                Text(startValTitle)
                    .font(.system(size: CGFloat(self.model.numericAxis.labels.fontSize)))
                    .foregroundColor(self.model.numericAxis.labels.color.color(self.colorScheme))
                    .position(x: self.rect.origin.x + self.rect.size.width / 2,
                              y: self.rect.origin.y + self.rect.size.height)
            }
            
            if !model.numericAxis.baseline.isHidden {
                // left base line
                LineShape(pos1: CGPoint(x: x, y: rect.size.height),
                          pos2: CGPoint(x: x, y: rect.origin.y))
                    .stroke(model.numericAxis.baseline.color.color(self.colorScheme),
                            style: StrokeStyle(lineWidth: CGFloat(model.numericAxis.baseline.width),
                                               dash: [CGFloat(self.model.numericAxis.baseline.dashPatternLength), CGFloat(self.model.numericAxis.baseline.dashPatternGap)]))
            }
        }
    }
    
    func formatYAxisTitle(value: CGFloat, total: Int) -> String {
        let minVal = model.ranges?[model.currentSeriesIndex].lowerBound ?? 0
        let maxVal = model.ranges?[model.currentSeriesIndex].upperBound ?? 0
        let range = CGFloat(maxVal - minVal) / CGFloat(total)
        
        let dataPrecision = (range >= 1) ? "%.0f" : (minVal >= 0.1 ? "%.1f" : "%.2f")
        
        return String(format: dataPrecision, value)
    }
}

struct YAxisView_Previews: PreviewProvider {
    static var previews: some View {
        YAxisView(rect: CGRect(x: 0, y: 0, width: 40, height: 400), chartWidth: 160).environmentObject(Tests.stockModels[1])
            .frame(width:300, height: 400, alignment: .topLeading)
            .padding()
            .previewLayout(.sizeThatFits)
        
    }
}