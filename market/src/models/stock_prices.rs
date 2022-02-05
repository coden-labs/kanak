pub use diesel::sql_types::Date;
use std::collections::HashMap;

use chrono::NaiveDate;

use crate::models::stock_assets::StockAsset;
use crate::utils::response_dto::AVTimeResponse;

use crate::schema::stock_prices;

#[derive(Queryable, Insertable)]
#[table_name="stock_prices"]
pub struct StockPrice{
    pub id: Option<uuid::Uuid>,
    pub query_symbol: String,
    pub stock_asset_id: uuid::Uuid,
    pub price_date: NaiveDate,
    pub adjusted_open_price: Option<f64>,
    pub adjusted_high_price: Option<f64>,
    pub adjusted_low_price: Option<f64>,
    pub adjusted_close_price: Option<f64>,
    pub open_price: Option<f64>,
    pub high_price: Option<f64>,
    pub low_price: Option<f64>,
    pub close_price: Option<f64>,
    pub is_adjusted: bool,
}

impl StockPrice{

    fn build_stock_price(date_string: &String, stock_price_info: &HashMap<String, String>, stock_asset: &StockAsset, is_adjusted: bool) -> Option<StockPrice> {
        let stock_price = StockPrice {
            id: None,
            query_symbol: stock_asset.query_symbol.clone(),
            stock_asset_id: stock_asset.id.clone(),
            price_date: NaiveDate::parse_from_str(date_string, "%Y-%m-%d").ok()?,
            open_price: Some(stock_price_info["1. open"].parse::<f64>().unwrap()),
            high_price: Some(stock_price_info["2. high"].parse::<f64>().unwrap()),
            low_price: Some(stock_price_info["3. low"].parse::<f64>().unwrap()),
            close_price: Some(stock_price_info["4. close"].parse::<f64>().unwrap()),
            adjusted_open_price: None,
            adjusted_low_price: None,
            adjusted_high_price: None,
            adjusted_close_price: None,
            is_adjusted: is_adjusted,
        };
        // TODO(@abhimanyuma): Add code to add ajusted data.
        Some(stock_price)
    }
    pub fn print_info(&self) {
        println!(
            "The OHLC for {} on {} was O-{:?}, H-{:?}, L-{:?}, C-{:?}", 
            self.query_symbol, self.price_date, 
            self.open_price, self.high_price, self.low_price, self.close_price
        )
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
