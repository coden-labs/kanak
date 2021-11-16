CREATE TABLE stock_assets (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  symbol VARCHAR NOT NULL,
  exchange VARCHAR NOT NULL,
  query_symbol VARCHAR NOT NULL,
  stock_name VARCHAR,
  timezone VARCHAR,
  region VARCHAR,
  currency VARCHAR NOT NULL
)
