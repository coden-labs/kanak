table! {
    stock_assets (id) {
        id -> Uuid,
        symbol -> Varchar,
        exchange -> Varchar,
        query_symbol -> Varchar,
        stock_name -> Nullable<Varchar>,
        timezone -> Nullable<Varchar>,
        region -> Nullable<Varchar>,
        currency -> Varchar,
    }
}

table! {
    stock_prices (id) {
        id -> Uuid,
        query_symbol -> Varchar,
        stock_asset_id -> Uuid,
        price_date -> Date,
        adjusted_open_price -> Nullable<Float8>,
        adjusted_high_price -> Nullable<Float8>,
        adjusted_low_price -> Nullable<Float8>,
        adjusted_close_price -> Nullable<Float8>,
        open_price -> Nullable<Float8>,
        high_price -> Nullable<Float8>,
        low_price -> Nullable<Float8>,
        close_price -> Nullable<Float8>,
        is_adjsted -> Bool,
    }
}

joinable!(stock_prices -> stock_assets (stock_asset_id));

allow_tables_to_appear_in_same_query!(
    stock_assets,
    stock_prices,
);
