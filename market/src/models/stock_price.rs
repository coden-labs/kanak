pub use diesel::sql_types::Date;
use std::collections::HashMap;

use chrono::NaiveDate;

use crate::models::stock_asset::StockAsset;
use crate::utils::response_dto::AVTimeResponse;

#[derive(Queryable)]
pub struct StockPrice{
    pub id: Option<uuid::Uuid>,
    pub query_symbol: String,
    pub stock_asset_id: uuid::Uuid,
    pub date: NaiveDate,
    pub adjusted_open: Option<f64>,
    pub adjusted_high: Option<f64>,
    pub adjusted_low: Option<f64>,
    pub adjusted_close: Option<f64>,
    pub open: Option<f64>,
    pub high: Option<f64>,
    pub low: Option<f64>,
    pub close: Option<f64>,
    pub is_adjusted: bool,
}

impl StockPrice{

    fn build_stock_price(date_string: &String, stock_price_info: &HashMap<String, String>, stock_asset: &StockAsset, is_adjusted: bool) -> Option<StockPrice> {
        let stock_price = StockPrice {
            id: None,
            query_symbol: stock_asset.query_symbol.clone(),
            stock_asset_id: stock_asset.id.clone(),
            date: NaiveDate::parse_from_str(date_string, "%Y-%m-%d").ok()?,
            open: Some(stock_price_info["1. open"].parse::<f64>().unwrap()),
            high: Some(stock_price_info["2. high"].parse::<f64>().unwrap()),
            low: Some(stock_price_info["3. low"].parse::<f64>().unwrap()),
            close: Some(stock_price_info["4. close"].parse::<f64>().unwrap()),
            adjusted_open: None,
            adjusted_low: None,
            adjusted_high: None,
            adjusted_close: None,
            is_adjusted: is_adjusted,
        };
        // TODO(@abhimanyuma): Add code to add ajusted data.
        Some(stock_price)
    }
    pub fn print_info(&self) {
        println!("The OHLC for {} on {} was O-{:?}, H-{:?}, L-{:?}, C-{:?}", self.query_symbol, self.date, self.open, self.high, self.low, self.close)
    }
}

impl StockPrice {

    // Class methods
    pub fn from_av_time_response(av_time_response: AVTimeResponse, stock_asset: &StockAsset, is_adjusted: bool) -> Vec<StockPrice> {
        let mut stock_prices: Vec<StockPrice> = Vec::new();
        let time_series = av_time_response.time_series_daily; 
        for (date_string, stock_price_info) in &time_series {
            let stock_price = StockPrice::build_stock_price(date_string, stock_price_info, stock_asset, is_adjusted);
            match stock_price {
                Some(valid_stock_price) => {stock_prices.push(valid_stock_price);}
                None => {} 
            }
        }
        stock_prices
    }
}
