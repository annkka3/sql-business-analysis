import sqlite3
from pathlib import Path
import pandas as pd
import matplotlib.pyplot as plt

ROOT = Path(__file__).resolve().parents[1]
db = ROOT / 'results/business_analysis.sqlite'
conn = sqlite3.connect(db)
cur = conn.cursor()
cur.executescript((ROOT/'sql/create_tables.sql').read_text())
for table in ['customers','products','orders']:
    df = pd.read_csv(ROOT / f'data/{table}.csv')
    df.to_sql(table, conn, if_exists='append', index=False)

queries = (ROOT/'sql/analysis_queries.sql').read_text().split(';')
outputs = []
for i, q in enumerate(queries, start=1):
    q = q.strip()
    if not q: continue
    df = pd.read_sql_query(q, conn)
    out = ROOT / f'results/query_{i}.csv'
    df.to_csv(out, index=False)
    outputs.append((i, df))

monthly = outputs[0][1]
plt.figure(figsize=(8,4))
plt.plot(monthly['month'], monthly['revenue'], marker='o')
plt.title('Monthly revenue from SQL analysis')
plt.xlabel('Month')
plt.ylabel('Revenue')
plt.xticks(rotation=45)
plt.tight_layout()
plt.savefig(ROOT / 'results/monthly_revenue_sql.png', dpi=160)

print(f'Created SQLite database: {db}')
print('Saved query results to results/query_*.csv')
conn.close()
