CREATE TABLE stock_prices (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  query_symbol VARCHAR NOT NULL,
  stock_asset_id uuid NOT NULL,
  price_date date NOT NULL,
  adjusted_open_price double precision,
  adjusted_high_price double precision,
  adjusted_low_price double precision,
  adjusted_close_price double precision,
  open_price double precision,
  high_price double precision,
  low_price double precision,
  close_price double precision,
  is_adjusted boolean NOT NULL,
  CONSTRAINT fk_stock_assets FOREIGN KEY(stock_asset_id) REFERENCES stock_assets(id),
  UNIQUE(stock_asset_id, price_date)
);
