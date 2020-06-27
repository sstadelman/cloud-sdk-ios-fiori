//
//  ESPMContainerMetadata+Extensions.swift
//  Reference
//
//  Created by Stan Stadelman on 6/26/20.
//  Copyright © 2020 SAP. All rights reserved.
//

import SAPOData

extension ESPMContainerMetadata.EntitySets {
    static var allCases: [EntitySet] = [
        ESPMContainerMetadata.EntitySets.products,
        ESPMContainerMetadata.EntitySets.productTexts,
        ESPMContainerMetadata.EntitySets.productCategories,
        ESPMContainerMetadata.EntitySets.stock,
        ESPMContainerMetadata.EntitySets.suppliers,
        ESPMContainerMetadata.EntitySets.salesOrderItems,
        ESPMContainerMetadata.EntitySets.salesOrderHeaders,
        ESPMContainerMetadata.EntitySets.customers,
        ESPMContainerMetadata.EntitySets.purchaseOrderItems,
        ESPMContainerMetadata.EntitySets.purchaseOrderHeaders,
    ]
}

extension ESPMContainerMetadata.EntityTypes {
    static var allCases: [EntityType] = [
        ESPMContainerMetadata.EntityTypes.product,
        ESPMContainerMetadata.EntityTypes.productText,
        ESPMContainerMetadata.EntityTypes.productCategory,
        ESPMContainerMetadata.EntityTypes.stock,
        ESPMContainerMetadata.EntityTypes.supplier,
        ESPMContainerMetadata.EntityTypes.salesOrderItem,
        ESPMContainerMetadata.EntityTypes.salesOrderHeader,
        ESPMContainerMetadata.EntityTypes.customer,
        ESPMContainerMetadata.EntityTypes.purchaseOrderItem,
        ESPMContainerMetadata.EntityTypes.purchaseOrderHeader,
    ]
}
