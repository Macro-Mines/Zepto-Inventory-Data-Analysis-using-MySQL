# Zepto Inventory Data Analysis Using MySQL

## Project Overview

This project explores Zepto inventory data using **MySQL** to identify
patterns in product pricing, discounts, stock availability, and
category-level inventory. The goal is to demonstrate how SQL can
transform raw inventory records into useful business insights for
pricing reviews, promotional analysis, and inventory planning.

The analysis covers data cleaning, exploratory data analysis (EDA),
aggregation, filtering, sorting, conditional classification, and
interpretation of results.

## Objectives

-   Inspect and clean the inventory dataset.
-   Explore products, categories, prices, discounts, and stock status.
-   Identify products with the highest discount percentages.
-   Find high-priced products that are out of stock.
-   Estimate available inventory value by category.
-   Identify high-MRP products with low discounts.
-   Compare average discount percentages across categories.
-   Compare product prices per gram.
-   Classify products by weight.
-   Estimate available inventory weight by category.
-   Translate SQL results into practical business insights.

## Dataset

-   **Source:** [Zepto Inventory Dataset on
    Kaggle](https://www.kaggle.com/datasets/palvinder2006/zepto-inventory-dataset)
-   **Original records:** 3,732
-   **Records retained after cleaning:** 3,723
-   **Records excluded by cleaning conditions:** 9
-   **Distinct product names in the cleaned dataset:** 1,672
-   **Categories:** 14

The dataset includes fields for category, product name, MRP, discount
percentage, available quantity, discounted selling price, weight,
out-of-stock status, and quantity.

> **Important data assumption:** Price values were treated as paise and
> divided by 100 to display Indian rupees. This assumption should be
> verified against the dataset documentation before using the figures
> for financial decisions.

## Tools and Skills

-   MySQL
-   SQL queries
-   Data cleaning and validation
-   Exploratory Data Analysis (EDA)
-   Aggregation with `SUM()`, `AVG()`, and `COUNT()`
-   Filtering with `WHERE`
-   Grouping with `GROUP BY`
-   Sorting with `ORDER BY`
-   Conditional classification using `CASE`
-   Business insight generation

## Data Cleaning

The original table was preserved, and a separate cleaned table was
created. Records were retained only when MRP, discounted selling price,
and product weight were greater than zero.

``` sql
CREATE TABLE zepto_inventory_clean AS
SELECT *
FROM zepto_inventory
WHERE mrp > 0
  AND discounted_selling_price > 0
  AND weight_in_gms > 0;
```

The cleaned table contains 3,723 records. This basic cleaning step
removes records that fail the selected validity conditions, but it does
not guarantee that every remaining record is unique or error-free.

## Business Questions and Analysis

The project answers the following eight questions:

1.  **Top 10 products by discount percentage** --- identifies products
    with the largest recorded discounts. The highest discount observed
    in the returned results was 51%.
2.  **High-MRP products that are out of stock** --- finds products with
    MRP above ₹500 and an out-of-stock status. Patanjali Cow's Ghee
    appeared in two category records with an MRP of ₹565 and zero
    available quantity.
3.  **Estimated available inventory value by category** --- estimates
    inventory value using discounted selling price multiplied by
    available quantity. Cooking Essentials and Munchies each recorded an
    estimated value of ₹337,131 in the results.
4.  **Products with MRP above ₹500 and discounts below 10%** ---
    identifies high-priced products receiving small discounts, including
    selected edible oil products.
5.  **Five categories with the highest average discount** --- Fruits &
    Vegetables had the highest average discount at 15.46%, followed by
    Meats, Fish & Eggs at 11.03%.
6.  **Lowest price per gram for products weighing more than 100 g** ---
    calculates unit price to help compare products and pack sizes.
    Comparisons are most useful between similar products.
7.  **Product weight classification** --- groups records into Low (100 g
    or less), Medium (above 100 g through 500 g), and Bulk (above 500
    g). Medium-weight records represented approximately 57.75% of the
    cleaned dataset.
8.  **Estimated available inventory weight by category** --- estimates
    stock weight using product weight and available quantity. Cooking
    Essentials and Munchies each recorded 1,404.326 kg in the results.

## Key Business Insights

-   **Discount opportunities:** Some products had discounts as high as
    51%, which may be useful for promotional analysis. Discount levels
    alone do not indicate profitability or overall customer value.
-   **Stock availability:** 453 records, or approximately 12.17% of
    cleaned records, were marked out of stock.
-   **Inventory value:** Cooking Essentials and Munchies had the highest
    estimated available inventory value in the reported results.
-   **Category discount patterns:** Fruits & Vegetables had the highest
    average discount at 15.46%.
-   **Unit-price comparisons:** Price per gram provides a consistent way
    to compare pack sizes, especially for similar products.
-   **Weight distribution:** Medium-weight records made up the largest
    group, at approximately 57.75%.
-   **Data quality:** Repeated product names and identical
    category-level results were observed. These records should be
    investigated before making operational decisions.

## Important Limitations

-   **Estimated inventory value is not revenue.** The dataset does not
    contain verified sales transactions or sales quantities. Inventory
    value was estimated using discounted selling price multiplied by
    available quantity.
-   **Price units need verification.** The analysis assumes prices are
    stored in paise.
-   **Inventory weight is an estimate.** The calculation assumes
    `weight_in_gms` is the weight of one unit and `available_quantity`
    is the number of available units.
-   **Repeated listings need review.** Some product names appear under
    more than one category. The analysis did not determine whether these
    are valid multi-category listings or duplicate records.
-   **No profit or demand conclusions.** Cost, margin, sales history,
    expiry dates, supplier lead times, and customer demand were not
    available.
-   **Weight groups are project-defined.** Low, Medium, and Bulk
    thresholds were selected for this analysis and are not official
    Zepto classifications.

## Repository Structure

A suggested structure for publishing the project:

``` text
zepto-inventory-analysis/
├── README.md
├── sql/
│   ├── data_cleaning.sql
│   └── business_analysis.sql
├── report/
│   └── Zepto_Inventory_Analysis_Final_Report.docx
└── data/
    └── README.md
```

Add your actual SQL scripts and report to the repository if you choose
to use this structure. Avoid uploading data files if their licence or
sharing terms do not permit redistribution; link to the original dataset
instead.

## How to Run the SQL Analysis

1.  Download the dataset from the Kaggle source.
2.  Import the data into MySQL and create the source table using the
    correct column names and data types.
3.  Run the cleaning query to create `zepto_inventory_clean`.
4.  Run the analysis queries for the eight business questions.
5.  Compare the outputs with the findings documented in the report.
6.  Verify price units and investigate repeated product listings before
    using the results for business decisions.

The exact import steps may vary depending on the dataset file format and
your MySQL environment.

## Conclusion

This project demonstrates how MySQL can be used to clean, explore, and
analyse inventory data. It provides practice with core SQL operations
and shows how query results can support questions about discounts, stock
availability, category-level inventory, unit pricing, and storage
planning.

Future improvements could include validating repeated listings,
incorporating actual sales and cost data, analysing demand over time,
identifying slow-moving products, and presenting the results in a Power
BI dashboard.

## Author

**\[Your Name\]**\
MBA in Financial Technology \| Pondicherry University

Add your LinkedIn profile and GitHub profile links here when ready.

------------------------------------------------------------------------

*This is an educational data analysis project. Findings are based on the
available dataset and the assumptions documented above.*
