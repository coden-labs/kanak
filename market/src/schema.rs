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
