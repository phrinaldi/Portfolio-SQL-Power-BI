# Portfolio-SQL-Power-BI

# 1- Projeto Integração SQL – Power BI

Este projeto tem como objetivo integrar o SQL ao Power BI para realização de dashboards da área Comercial da AdventureWorks.

## 2- Download arquivo .bak AdventureWorks2014

[AdventureWorks2014 Download](https://docs.microsoft.com/pt-br/sql/samples/adventureworks-install-configure?view=sql-server-ver16&tabs=ssms)

## 3. Definindo os indicadores do projeto

-- ABA GERAL

- i) Receita Total  
- ii) Quantidade Vendida  
- iii) Total de Categorias de Produtos  
- iv) Quantidade de Clientes  
- v) Receita Total e Lucro Total por Mês  
- vi) Margem de Lucro  
- vii) Quantidade Vendida por Mês  
- viii) Lucro por País

-- ABA CLIENTES

- i) Vendas por País  
- ii) Clientes por País  
- iii) Vendas por Gênero  
- iv) Vendas por Categoria

## 4. Definindo as tabelas e colunas a serem usadas no projeto

-- TABELAS

```sql
SELECT * FROM FactInternetSales;
SELECT * FROM DimProductCategory;
SELECT * FROM DimCustomer;
SELECT * FROM DimGeography;

-- COLUNAS

- SalesOrderNumber (FactInternetSales)  
- OrderDate (FactInternetSales)  
- EnglishProductCategoryName (DimProductCategory)  
- CustomerKey (DimCustomer)  
- FirstName + ' ' + LastName (DimCustomer)  
- Gender (DimCustomer)  
- EnglishCountryRegionName (DimGeography)  
- OrderQuantity (FactInternetSales)  
- SalesAmount (FactInternetSales)  
- TotalProductCost (FactInternetSales)  
- SalesAmount - TotalProductCost (FactInternetSales)

## 5. Criando a View RESULTADOS_ADW

CREATE OR ALTER VIEW RESULTADOS_ADW AS
SELECT
    fis.SalesOrderNumber AS 'Nº PEDIDO',
    fis.OrderDate AS 'DATA PEDIDO',
    dpc.EnglishProductCategoryName AS 'CATEGORIA PRODUTO',
    fis.CustomerKey AS 'ID CLIENTE',
    dc.FirstName + ' ' + dc.LastName AS 'NOME CLIENTE',
    REPLACE(REPLACE(dc.Gender, 'M', 'Masculino'), 'F', 'Feminino') AS 'GÊNERO',
    dp.EnglishCountryRegionName AS 'PAÍS',
    fis.OrderQuantity AS 'QTD. VENDIDA',
    fis.SalesAmount AS 'RECEITA VENDA',
    fis.TotalProductCost AS 'CUSTO VENDA',
    fis.SalesAmount - fis.TotalProductCost AS 'LUCRO VENDA'
FROM FactInternetSales fis
INNER JOIN DimProduct dp ON fis.ProductKey = dp.ProductKey
    INNER JOIN DimProductSubcategory dps ON dp.ProductSubcategoryKey = dps.ProductSubcategoryKey
        INNER JOIN DimProductCategory dpc ON dps.ProductCategoryKey = dpc.ProductCategoryKey
INNER JOIN DimCustomer dc ON fis.CustomerKey = dc.CustomerKey
    INNER JOIN DimGeography dg ON dc.GeographyKey = dg.GeographyKey;

## 6. Podemos conectar diretamente ao Power BI. Mas baixaremos o Excel e conectaremos na planilha.

## 7. Criação de cartões e gráficos no Power BI
