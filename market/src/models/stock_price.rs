pub use diesel::sql_types::Date;

use crate::models::stock_asset::StockAsset;
use crate::utils::response_dto::AVTimeResponse;

#[derive(Queryable)]
pub struct StockPrice{
    pub id: Option<uuid::Uuid>,
    pub query_symbol: String,
    pub stock_asset_id: uuid::Uuid,
    pub date: Date,
    pub adjusted_open: Option<f64>,
    pub adjusted_high: Option<f64>,
    pub adjusted_low: Option<f64>,
    pub adjusted_close: f64,
    pub open: Option<f64>,
    pub high: Option<f64>,
    pub low: Option<f64>,
    pub close: Option<f64>,
}

impl StockPrice{
    pub fn from_av_time_response(av_time_response: AVTimeResponse, stock_asset: StockAsset) -> Vec<StockPrice> {
        let stock_prices: Vec<StockPrice> = Vec::new();
        let time_series = av_time_response.time_series_daily;
        for (date_string, stock_price_info) in time_series.iter() {
            print!("The stock price for {} on {} date - ", stock_asset.query_symbol, date_string);
            for (k, v) in stock_price_info.iter() {
                print!("{} is {}", k, v);
            }
            print!("\n");
        }
        stock_prices
    }
}
