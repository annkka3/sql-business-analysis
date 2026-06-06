# SQL Business Analysis: Revenue, Customers & Product Performance

    **Role:** Data Analyst / SQL Analyst  
    **Dataset:** Synthetic / anonymized demo data created for portfolio use.  
    **Stack:** SQLite, SQL, CTEs, joins, window functions, pandas, matplotlib

    ## Business problem

    A retail/e-commerce business needs to understand revenue trends, category performance, repeat customers, top customers and country-level performance from normalized relational data.

    ## What was built

    Built a reproducible SQL analysis project using customers, products and orders tables. The project includes database creation, analytical SQL queries, CSV exports and a revenue trend chart.

    ## Key outputs

    - `sql/analysis_queries.sql` — 5 business queries
- `results/query_*.csv` — query outputs
- `results/business_analysis.sqlite` — reproducible local database
- `results/monthly_revenue_sql.png` — revenue visualization

    ## How to run

    ```bash
    python -m venv .venv
    source .venv/bin/activate  # Windows: .venv\Scripts\activate
    pip install -r requirements.txt
    python src/main.py
    ```

    ## Resume-ready bullets

    - Built SQL analysis across normalized customer, product and order tables using joins, aggregations, CTE logic and window functions.
- Analyzed monthly revenue, repeat customer rate, category performance, top customers and country-level revenue efficiency.

  ## Business recommendation

The treatment group improved final purchase conversion by X pp.
If p-value < 0.05, the variant can be considered statistically significant.
If p-value >= 0.05, keep the test running or increase sample size.

![Funnel conversion by group](results/funnel_conversion_by_group.png)
