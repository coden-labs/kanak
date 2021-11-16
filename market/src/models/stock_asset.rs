#[derive(Queryable)]
pub struct StockAsset{
    pub id: uuid::Uuid,
    pub symbol: String,
    pub exchange: String,
    pub query_symbol: String,
    pub stock_name: Option<String>,
    pub timezone: Option<String>,
    pub region: Option<String>,
    pub currency: String,
}
