//
//  ProgressView.swift
//  EnhancedProgressAPI
//
//  Created by Stadelman, Stan on 5/20/20.
//  Copyright © 2020 SAP. All rights reserved.
//

import SAPOData
import SAPOfflineOData
import SwiftUI
import Combine

struct ProgressOperation: Identifiable {
    let id: String
    let step: OfflineODataProviderProgressReporting
}

struct ODataProgressViewContainer: View {
    var steps: [String: OfflineODataProviderProgressReporting]
    
    var body: some View {
        GeometryReader { proxy in
            
            VStack(alignment: .leading, spacing: 8) {
                Spacer()
                ForEach(self.steps.values.sorted(by: { $0.operationId < $1.operationId }), id: \.operationId) {
                    ODataProgressView(step: $0)
                        .frame(height: 68, alignment: .top)
                }
            }
            .frame(width: proxy.size.width, alignment: .leading)
        }
    }
}

struct ODataProgressView: View {
    let step: OfflineODataProviderProgressReporting

    var body: some View {
        GeometryReader { geometry in
            VStack(alignment: .center, spacing: 4) {
                ZStack(alignment: .leading) {
                    Rectangle().frame(width: geometry.size.width, height: 18)
                        .opacity(0.3)
                        .foregroundColor(Color(UIColor.systemTeal))
                    
                    Rectangle().frame(width: min(self.progress() * geometry.size.width, geometry.size.width), height: 18)
                        .foregroundColor(Color(UIColor.systemBlue))
                        .animation(.linear)
                }.cornerRadius(45.0)
                Text(self.step.defaultMessage)
                    .lineLimit(2)
            }
        }
    }

    private func progress() -> CGFloat {
        let val = CGFloat(step.currentStepNumber) / CGFloat(step.totalNumberOfSteps)
        print(step.step.rawValue)
        return val
    }
}

struct ProgressView_Previews: PreviewProvider {
    static var previews: some View {
        ODataProgressView(step: Progress(operationId: UUID().uuidString, currentStepNumber: 7, totalNumberOfSteps: 11, time: .now(), step: .downloadingEntityStore, parameters: ["1414"], defaultMessage: "Performing step 7 of 11: Receiving data from the server. Received 1414 bytes so far")).frame(height: 20)
    }
}

struct Progress: OfflineODataProviderProgressReporting {
    
    var operationId: String
    
    var currentStepNumber: Int

    var totalNumberOfSteps: Int

    var time: GlobalDateTime

    var step: OfflineODataOperationStep

    var parameters: [String]

    var defaultMessage: String
}

/*
 protocol IdOfflineODataProgressReporting: OfflineODataProgressReporting {

 var currentStepNumber: Int { get }

 var totalNumberOfSteps: Int { get }

 var time: GlobalDateTime { get }

 var step: OfflineODataOperationStep { get }

 var parameters: [String] { get }

 var defaultMessage: String { get }

 }

 extension IdOfflineODataProgressReporting {
 public var id: Int {
     return totalNumberOfSteps
 }
 }

 */
