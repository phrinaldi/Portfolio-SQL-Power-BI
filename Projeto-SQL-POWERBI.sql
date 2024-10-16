go
CREATE OR ALTER VIEW RESULTADOS_ADW AS
SELECT
    fis.SalesOrderNumber AS 'N� PEDIDO',
    fis.OrderDate AS 'DATA PEDIDO',
    dpc.EnglishProductCategoryName AS 'CATEGORIA PRODUTO',
    fis.CustomerKey AS 'ID CLIENTE',
    dc.FirstName + ' ' + dc.LastName AS 'NOME CLIENTE',
    REPLACE(REPLACE(dc.Gender, 'M', 'Masculino'), 'F', 'Feminino') AS 'G�NERO',
    dg.EnglishCountryRegionName AS 'PA�S',
    fis.OrderQuantity AS 'QTD. VENDIDA',
    fis.SalesAmount AS 'RECEITA VENDA',
    fis.TotalProductCost AS 'CUSTO VENDA',
    fis.SalesAmount - fis.TotalProductCost AS 'LUCRO VENDA'
FROM FactInternetSales fis
INNER JOIN DimProduct dp ON fis.ProductKey = dp.ProductKey
	INNER JOIN DimProductSubcategory dps ON dp.ProductSubcategoryKey = dps.ProductSubcategoryKey
		INNER JOIN DimProductCategory dpc ON dps.ProductCategoryKey = dpc.ProductCategoryKey
INNER JOIN DimCustomer dc ON fis.CustomerKey = dc.CustomerKey
	INNER JOIN DimGeography dg ON dc.GeographyKey = dg.GeographyKey
go

SELECT * FROM RESULTADOS_ADW