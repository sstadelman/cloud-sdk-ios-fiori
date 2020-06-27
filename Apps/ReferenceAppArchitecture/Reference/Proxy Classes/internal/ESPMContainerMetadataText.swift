// # Proxy Compiler 20.3.2-74d649-20200526

import Foundation
import SAPOData

internal class ESPMContainerMetadataText {
    internal static let xml: String = "<?xml version=\"1.0\" ?>\n<?xmlc base=\"36\"?>\n<?xmlc-define _0=\"Name\" _1=\"Type\" _2=\"Property\" _3=\"Nullable\" _4=\"MaxLength\" _5=\"Role\" _6=\"End\" _7=\"EntityType\" _8=\"PropertyRef\" _9=\"EntitySet\" _A=\"Association\" _B=\"Precision\" _C=\"Scale\" _D=\"Key\" _E=\"Dependent\" _F=\"Multiplicity\" _G=\"Principal\" _H=\"ReferentialConstraint\" _I=\"AssociationSet\" _J=\"NavigationProperty\" _K=\"ToRole\" _L=\"Relationship\" _M=\"FromRole\" _N=\"Action\" _O=\"OnDelete\" _P=\"FunctionImport\" _Q=\"ReturnType\" _R=\"m:HttpMethod\" _S=\"Parameter\" _T=\"edmx:DataServices\" _U=\"edmx:Edmx\" _V=\"ComplexType\" _W=\"Schema\" _X=\"EntityContainer\" _Y=\"m:HasStream\" _Z=\"xmlns:m\" _10=\"xmlns:edmx\" _11=\"m:DataServiceVersion\" _12=\"m:IsDefaultEntityContainer\" $0=\"true\" $1=\"Edm.String\" $2=\"3\" $3=\"false\" $4=\"Edm.Decimal\" $5=\"Product\" $6=\"ProductId\" $7=\"36\" $8=\"15\" $9=\"SalesOrderHeader\" $A=\"PurchaseOrderHeader\" $B=\"Supplier\" $C=\"PurchaseOrderItem\" $D=\"SalesOrderItem\" $E=\"40\" $F=\"1\" $G=\"13\" $H=\"255\" $I=\"Stock\" $J=\"SupplierId\" $K=\"Edm.DateTime\" $L=\"*\" $M=\"PurchaseOrderId\" $N=\"SalesOrderId\" $O=\"Customer\" $P=\"Products\" $Q=\"UpdatedTimestamp\" $R=\"CustomerId\" $S=\"5\" $T=\"Edm.Boolean\" $U=\"ESPM.Product\" $V=\"None\" $W=\"CurrencyCode\" $X=\"GrossAmount\" $Y=\"NetAmount\" $Z=\"POST\" $10=\"10\" $11=\"ItemNumber\" $12=\"TaxAmount\" $13=\"ProductDetails\" $14=\"PurchaseOrderHeaders\" $15=\"4\" $16=\"Category\" $17=\"ESPM.PurchaseOrderHeader\" $18=\"ESPM.SalesOrderItem\" $19=\"ESPM.Customer_to_SalesOrderHeaders\" $1A=\"Street\" $1B=\"ESPM.PurchaseOrderHeader_to_PurchaseOrderItems\" $1C=\"SalesOrderItems\" $1D=\"Cascade\" $1E=\"ESPM.SalesOrderHeader\" $1F=\"ESPM.Product_to_Stock\" $1G=\"HouseNumber\" $1H=\"Country\" $1I=\"ESPM.Supplier_to_PurchaseOrderHeaders\" $1J=\"ESPM.Supplier_to_Products\" $1K=\"ESPM.Supplier\" $1L=\"Suppliers\" $1M=\"PostalCode\" $1N=\"Address\" $1O=\"QuantityUnit\" $1P=\"Quantity\" $1Q=\"City\" $1R=\"ESPM.SalesOrderHeader_to_SalesOrderItems\" $1S=\"PurchaseOrderItems\" $1T=\"SalesOrderHeaders\" $1U=\"ESPM.PurchaseOrderItem\" $1V=\"1.0\" $1W=\"Name\" $1X=\"PhoneNumber\" $1Y=\"CategoryName\" $1Z=\"ESPM.Stock\" $20=\"Product_to_Stock\" $21=\"Items\" $22=\"Product_to_SalesOrderItems\" $23=\"Id\" $24=\"SupplierDetails\" $25=\"Supplier_to_Products\" $26=\"ESPM.Product_to_SalesOrderItems\" $27=\"60\" $28=\"ESPM.Product_to_PurchaseOrderItems\" $29=\"Header\" $2A=\"Product_to_PurchaseOrderItems\" $2B=\"EmailAddress\" $2C=\"Edm.Int64\" $2D=\"ESPM.Customer\" $2E=\"ShortDescription\" $2F=\"30\" $2G=\"Edm.Int32\" $2H=\"LongDescription\" $2I=\"Customer_to_SalesOrderHeaders\" $2J=\"ESPM.Address\" $2K=\"Supplier_to_PurchaseOrderHeaders\" $2L=\"PurchaseOrderHeader_to_PurchaseOrderItems\" $2M=\"Customers\" $2N=\"SalesOrderHeader_to_SalesOrderItems\"?>\n<_U Version=\"$1V\" _10=\"http://schemas.microsoft.com/ado/2007/06/edmx\"><_T _11=\"$1V\" _Z=\"http://schemas.microsoft.com/ado/2007/08/dataservices/metadata\"><_W Namespace=\"ESPM\" xmlns=\"http://schemas.microsoft.com/ado/2008/09/edm\"><_7 _0=\"$O\"><_D><_8 _0=\"$R\"/></_D><_2 _0=\"$1Q\" _1=\"$1\" _3=\"$0\" _4=\"$E\"/><_2 _0=\"$1H\" _1=\"$1\" _3=\"$0\" _4=\"$2\"/><_2 _0=\"$R\" _1=\"$1\" _3=\"$3\" _4=\"$7\"/><_2 _0=\"DateOfBirth\" _1=\"$K\" _3=\"$3\"/><_2 _0=\"$2B\" _1=\"$1\" _3=\"$0\" _4=\"$H\"/><_2 _0=\"FirstName\" _1=\"$1\" _3=\"$0\" _4=\"$E\"/><_2 _0=\"$1G\" _1=\"$1\" _3=\"$0\" _4=\"$10\"/><_2 _0=\"LastName\" _1=\"$1\" _3=\"$0\" _4=\"$E\"/><_2 _0=\"$1X\" _1=\"$1\" _3=\"$0\" _4=\"$2F\"/><_2 _0=\"$1M\" _1=\"$1\" _3=\"$0\" _4=\"$10\"/><_2 _0=\"$1A\" _1=\"$1\" _3=\"$0\" _4=\"$27\"/><_2 _0=\"$1N\" _1=\"$2J\" _3=\"$0\"/><_2 _0=\"$Q\" _1=\"$K\"/><_J _0=\"SalesOrders\" _L=\"$19\" _M=\"$O\" _K=\"$9\"/></_7><_V _0=\"$1N\"><_2 _0=\"$1G\" _1=\"$1\" _3=\"$0\"/><_2 _0=\"$1A\" _1=\"$1\" _3=\"$0\"/><_2 _0=\"$1Q\" _1=\"$1\" _3=\"$0\"/><_2 _0=\"$1H\" _1=\"$1\" _3=\"$0\"/><_2 _0=\"$1M\" _1=\"$1\" _3=\"$0\"/></_V><_7 _0=\"$B\"><_D><_8 _0=\"$J\"/></_D><_2 _0=\"$1Q\" _1=\"$1\" _3=\"$0\" _4=\"$E\"/><_2 _0=\"$1H\" _1=\"$1\" _3=\"$0\" _4=\"$2\"/><_2 _0=\"$2B\" _1=\"$1\" _3=\"$0\" _4=\"$H\"/><_2 _0=\"$1G\" _1=\"$1\" _3=\"$0\" _4=\"$10\"/><_2 _0=\"$1X\" _1=\"$1\" _3=\"$0\" _4=\"$2F\"/><_2 _0=\"$1M\" _1=\"$1\" _3=\"$0\" _4=\"$10\"/><_2 _0=\"$1A\" _1=\"$1\" _3=\"$0\" _4=\"$27\"/><_2 _0=\"$J\" _1=\"$1\" _3=\"$3\" _4=\"$7\"/><_2 _0=\"SupplierName\" _1=\"$1\" _3=\"$0\" _4=\"80\"/><_2 _0=\"$1N\" _1=\"$2J\" _3=\"$0\"/><_2 _0=\"$Q\" _1=\"$K\"/><_J _0=\"$P\" _L=\"$1J\" _M=\"$B\" _K=\"$5\"/><_J _0=\"PurchaseOrders\" _L=\"$1I\" _M=\"$B\" _K=\"$A\"/></_7><_7 _0=\"$5\" _Y=\"$0\"><_D><_8 _0=\"$6\"/></_D><_2 _0=\"$16\" _1=\"$1\" _3=\"$0\" _4=\"$E\"/><_2 _0=\"$1Y\" _1=\"$1\" _3=\"$0\" _4=\"$E\"/><_2 _0=\"$W\" _1=\"$1\" _3=\"$0\" _4=\"$S\"/><_2 _0=\"DimensionDepth\" _1=\"$4\" _3=\"$0\" _B=\"$G\" _C=\"$15\"/><_2 _0=\"DimensionHeight\" _1=\"$4\" _3=\"$0\" _B=\"$G\" _C=\"$15\"/><_2 _0=\"DimensionUnit\" _1=\"$1\" _3=\"$0\" _4=\"$2\"/><_2 _0=\"DimensionWidth\" _1=\"$4\" _3=\"$0\" _B=\"$G\" _C=\"$15\"/><_2 _0=\"$2H\" _1=\"$1\" _3=\"$0\" _4=\"$H\"/><_2 _0=\"$1W\" _1=\"$1\"/><_2 _0=\"PictureUrl\" _1=\"$1\" _3=\"$0\" _4=\"$H\"/><_2 _0=\"Price\" _1=\"$4\" _3=\"$0\" _B=\"23\" _C=\"$2\"/><_2 _0=\"$6\" _1=\"$1\" _3=\"$3\" _4=\"$7\"/><_2 _0=\"$1O\" _1=\"$1\" _3=\"$0\" _4=\"$2\"/><_2 _0=\"$2E\" _1=\"$1\" _3=\"$0\" _4=\"$H\"/><_2 _0=\"$J\" _1=\"$1\" _3=\"$3\" _4=\"$7\"/><_2 _0=\"$Q\" _1=\"$K\"/><_2 _0=\"Weight\" _1=\"$4\" _3=\"$0\" _B=\"$G\" _C=\"$2\"/><_2 _0=\"WeightUnit\" _1=\"$1\" _3=\"$0\" _4=\"$2\"/><_J _0=\"StockDetails\" _L=\"$1F\" _M=\"$5\" _K=\"$I\"/><_J _0=\"$24\" _L=\"$1J\" _M=\"$5\" _K=\"$B\"/></_7><_7 _0=\"ProductCategory\"><_D><_8 _0=\"$16\"/></_D><_2 _0=\"$16\" _1=\"$1\" _3=\"$3\" _4=\"$E\"/><_2 _0=\"$1Y\" _1=\"$1\" _3=\"$0\" _4=\"$E\"/><_2 _0=\"MainCategory\" _1=\"$1\" _3=\"$0\" _4=\"$E\"/><_2 _0=\"MainCategoryName\" _1=\"$1\" _3=\"$0\" _4=\"$E\"/><_2 _0=\"NumberOfProducts\" _1=\"$2C\" _3=\"$0\"/><_2 _0=\"$Q\" _1=\"$K\"/></_7><_7 _0=\"ProductText\"><_D><_8 _0=\"$23\"/></_D><_2 _0=\"$23\" _1=\"$2C\" _3=\"$3\"/><_2 _0=\"Language\" _1=\"$1\" _3=\"$0\" _4=\"2\"/><_2 _0=\"$2H\" _1=\"$1\" _3=\"$0\" _4=\"$H\"/><_2 _0=\"$1W\" _1=\"$1\"/><_2 _0=\"$6\" _1=\"$1\" _3=\"$3\" _4=\"$7\"/><_2 _0=\"$2E\" _1=\"$1\" _3=\"$0\" _4=\"$H\"/></_7><_7 _0=\"$I\"><_D><_8 _0=\"$6\"/></_D><_2 _0=\"LotSize\" _1=\"$4\" _3=\"$0\" _B=\"$G\" _C=\"$2\"/><_2 _0=\"MinStock\" _1=\"$4\" _3=\"$0\" _B=\"$G\" _C=\"$2\"/><_2 _0=\"$6\" _1=\"$1\" _3=\"$3\" _4=\"$H\"/><_2 _0=\"$1P\" _1=\"$4\" _3=\"$0\" _B=\"$G\" _C=\"$2\"/><_2 _0=\"QuantityLessMin\" _1=\"$T\" _3=\"$0\"/><_2 _0=\"$Q\" _1=\"$K\"/><_J _0=\"$13\" _L=\"$1F\" _M=\"$I\" _K=\"$5\"/></_7><_7 _0=\"$A\"><_D><_8 _0=\"$M\"/></_D><_2 _0=\"$W\" _1=\"$1\" _3=\"$0\" _4=\"$S\"/><_2 _0=\"$X\" _1=\"$4\" _3=\"$0\" _B=\"$8\" _C=\"$2\"/><_2 _0=\"$Y\" _1=\"$4\" _3=\"$0\" _B=\"$8\" _C=\"$2\"/><_2 _0=\"$M\" _1=\"$1\" _3=\"$3\" _4=\"$7\"/><_2 _0=\"$J\" _1=\"$1\" _3=\"$3\" _4=\"$7\"/><_2 _0=\"$12\" _1=\"$4\" _3=\"$0\" _B=\"$8\" _C=\"$2\"/><_J _0=\"$21\" _L=\"$1B\" _M=\"$A\" _K=\"$C\"/><_J _0=\"$24\" _L=\"$1I\" _M=\"$A\" _K=\"$B\"/></_7><_7 _0=\"$C\"><_D><_8 _0=\"$11\"/><_8 _0=\"$M\"/></_D><_2 _0=\"$W\" _1=\"$1\" _3=\"$0\" _4=\"$S\"/><_2 _0=\"$X\" _1=\"$4\" _3=\"$0\" _B=\"$8\" _C=\"$2\"/><_2 _0=\"$11\" _1=\"$2G\" _3=\"$3\"/><_2 _0=\"$Y\" _1=\"$4\" _3=\"$0\" _B=\"$8\" _C=\"$2\"/><_2 _0=\"$6\" _1=\"$1\" _3=\"$3\" _4=\"$7\"/><_2 _0=\"$M\" _1=\"$1\" _3=\"$3\" _4=\"$7\"/><_2 _0=\"$1P\" _1=\"$4\" _3=\"$0\" _B=\"$G\" _C=\"$2\"/><_2 _0=\"$1O\" _1=\"$1\" _3=\"$0\" _4=\"$2\"/><_2 _0=\"$12\" _1=\"$4\" _3=\"$0\" _B=\"$8\" _C=\"$2\"/><_J _0=\"$29\" _L=\"$1B\" _M=\"$C\" _K=\"$A\"/><_J _0=\"$13\" _L=\"$28\" _M=\"$C\" _K=\"$5\"/></_7><_7 _0=\"$9\"><_D><_8 _0=\"$N\"/></_D><_2 _0=\"CreatedAt\" _1=\"$K\" _3=\"$0\"/><_2 _0=\"$W\" _1=\"$1\" _3=\"$0\" _4=\"$S\"/><_2 _0=\"$R\" _1=\"$1\" _3=\"$3\" _4=\"$7\"/><_2 _0=\"$X\" _1=\"$4\" _3=\"$0\" _B=\"$8\" _C=\"$2\"/><_2 _0=\"LifeCycleStatus\" _1=\"$1\" _3=\"$3\" _4=\"$F\"/><_2 _0=\"LifeCycleStatusName\" _1=\"$1\" _3=\"$3\" _4=\"$H\"/><_2 _0=\"$Y\" _1=\"$4\" _3=\"$0\" _B=\"$8\" _C=\"$2\"/><_2 _0=\"$N\" _1=\"$1\" _3=\"$3\" _4=\"$7\"/><_2 _0=\"$12\" _1=\"$4\" _3=\"$0\" _B=\"$8\" _C=\"$2\"/><_J _0=\"$21\" _L=\"$1R\" _M=\"$9\" _K=\"$D\"/><_J _0=\"CustomerDetails\" _L=\"$19\" _M=\"$9\" _K=\"$O\"/></_7><_7 _0=\"$D\"><_D><_8 _0=\"$11\"/><_8 _0=\"$N\"/></_D><_2 _0=\"$W\" _1=\"$1\" _3=\"$0\" _4=\"$S\"/><_2 _0=\"DeliveryDate\" _1=\"$K\" _3=\"$0\"/><_2 _0=\"$X\" _1=\"$4\" _3=\"$0\" _B=\"$8\" _C=\"$2\"/><_2 _0=\"$11\" _1=\"$2G\" _3=\"$3\"/><_2 _0=\"$Y\" _1=\"$4\" _3=\"$0\" _B=\"$8\" _C=\"$2\"/><_2 _0=\"$6\" _1=\"$1\" _3=\"$3\" _4=\"$7\"/><_2 _0=\"$1P\" _1=\"$4\" _3=\"$0\" _B=\"$G\" _C=\"$2\"/><_2 _0=\"$1O\" _1=\"$1\" _3=\"$0\" _4=\"$2\"/><_2 _0=\"$N\" _1=\"$1\" _3=\"$3\" _4=\"$7\"/><_2 _0=\"$12\" _1=\"$4\" _3=\"$0\" _B=\"$8\" _C=\"$2\"/><_J _0=\"$29\" _L=\"$1R\" _M=\"$D\" _K=\"$9\"/><_J _0=\"$13\" _L=\"$26\" _M=\"$D\" _K=\"$5\"/></_7><_A _0=\"$2I\"><_6 _1=\"$2D\" _F=\"$F\" _5=\"$O\"><_O _N=\"$V\"/></_6><_6 _1=\"$1E\" _F=\"$L\" _5=\"$9\"/><_H><_G _5=\"$O\"><_8 _0=\"$R\"/></_G><_E _5=\"$9\"><_8 _0=\"$R\"/></_E></_H></_A><_A _0=\"$2K\"><_6 _1=\"$1K\" _F=\"$F\" _5=\"$B\"><_O _N=\"$V\"/></_6><_6 _1=\"$17\" _F=\"$L\" _5=\"$A\"/><_H><_G _5=\"$B\"><_8 _0=\"$J\"/></_G><_E _5=\"$A\"><_8 _0=\"$J\"/></_E></_H></_A><_A _0=\"$25\"><_6 _1=\"$1K\" _F=\"$F\" _5=\"$B\"><_O _N=\"$V\"/></_6><_6 _1=\"$U\" _F=\"$L\" _5=\"$5\"/><_H><_G _5=\"$B\"><_8 _0=\"$J\"/></_G><_E _5=\"$5\"><_8 _0=\"$J\"/></_E></_H></_A><_A _0=\"$2A\"><_6 _1=\"$U\" _F=\"$F\" _5=\"$5\"><_O _N=\"$V\"/></_6><_6 _1=\"$1U\" _F=\"$L\" _5=\"$C\"/><_H><_G _5=\"$5\"><_8 _0=\"$6\"/></_G><_E _5=\"$C\"><_8 _0=\"$6\"/></_E></_H></_A><_A _0=\"$22\"><_6 _1=\"$U\" _F=\"$F\" _5=\"$5\"><_O _N=\"$V\"/></_6><_6 _1=\"$18\" _F=\"$L\" _5=\"$D\"/><_H><_G _5=\"$5\"><_8 _0=\"$6\"/></_G><_E _5=\"$D\"><_8 _0=\"$6\"/></_E></_H></_A><_A _0=\"$20\"><_6 _1=\"$U\" _F=\"$F\" _5=\"$5\"><_O _N=\"$1D\"/></_6><_6 _1=\"$1Z\" _F=\"$F\" _5=\"$I\"/><_H><_G _5=\"$5\"><_8 _0=\"$6\"/></_G><_E _5=\"$I\"><_8 _0=\"$6\"/></_E></_H></_A><_A _0=\"$2L\"><_6 _1=\"$17\" _F=\"$F\" _5=\"$A\"><_O _N=\"$1D\"/></_6><_6 _1=\"$1U\" _F=\"$L\" _5=\"$C\"/><_H><_G _5=\"$A\"><_8 _0=\"$M\"/></_G><_E _5=\"$C\"><_8 _0=\"$M\"/></_E></_H></_A><_A _0=\"$2N\"><_6 _1=\"$1E\" _F=\"$F\" _5=\"$9\"><_O _N=\"$1D\"/></_6><_6 _1=\"$18\" _F=\"$L\" _5=\"$D\"/><_H><_G _5=\"$9\"><_8 _0=\"$N\"/></_G><_E _5=\"$D\"><_8 _0=\"$N\"/></_E></_H></_A><_X _0=\"ESPMContainer\" _12=\"$0\"><_9 _0=\"$2M\" _7=\"$2D\"/><_9 _0=\"$1L\" _7=\"$1K\"/><_9 _0=\"$P\" _7=\"$U\"/><_9 _0=\"ProductCategories\" _7=\"ESPM.ProductCategory\"/><_9 _0=\"ProductTexts\" _7=\"ESPM.ProductText\"/><_9 _0=\"$I\" _7=\"$1Z\"/><_9 _0=\"$14\" _7=\"$17\"/><_9 _0=\"$1S\" _7=\"$1U\"/><_9 _0=\"$1T\" _7=\"$1E\"/><_9 _0=\"$1C\" _7=\"$18\"/><_I _0=\"$2I\" _A=\"$19\"><_6 _9=\"$2M\" _5=\"$O\"/><_6 _9=\"$1T\" _5=\"$9\"/></_I><_I _0=\"$2K\" _A=\"$1I\"><_6 _9=\"$1L\" _5=\"$B\"/><_6 _9=\"$14\" _5=\"$A\"/></_I><_I _0=\"$25\" _A=\"$1J\"><_6 _9=\"$1L\" _5=\"$B\"/><_6 _9=\"$P\" _5=\"$5\"/></_I><_I _0=\"$2A\" _A=\"$28\"><_6 _9=\"$P\" _5=\"$5\"/><_6 _9=\"$1S\" _5=\"$C\"/></_I><_I _0=\"$22\" _A=\"$26\"><_6 _9=\"$1C\" _5=\"$D\"/><_6 _9=\"$P\" _5=\"$5\"/></_I><_I _0=\"$20\" _A=\"$1F\"><_6 _9=\"$P\" _5=\"$5\"/><_6 _9=\"$I\" _5=\"$I\"/></_I><_I _0=\"$2L\" _A=\"$1B\"><_6 _9=\"$1S\" _5=\"$C\"/><_6 _9=\"$14\" _5=\"$A\"/></_I><_I _0=\"$2N\" _A=\"$1R\"><_6 _9=\"$1C\" _5=\"$D\"/><_6 _9=\"$1T\" _5=\"$9\"/></_I><_P _0=\"GenerateSamplePurchaseOrders\" _Q=\"$T\" _R=\"$Z\"/><_P _0=\"GenerateSampleSalesOrders\" _Q=\"$T\" _R=\"$Z\"/><_P _0=\"ResetSampleData\" _Q=\"$T\" _R=\"$Z\"/><_P _0=\"UpdateSalesOrderStatus\" _Q=\"$T\" _R=\"$Z\"><_S _0=\"id\" _1=\"$1\" _3=\"$3\"/><_S _0=\"newStatus\" _1=\"$1\" _3=\"$3\"/></_P></_X></_W></_T></_U>"
}
