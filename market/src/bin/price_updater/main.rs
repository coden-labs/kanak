use diesel::prelude::*;
use market_lib::models::stock_asset::StockAsset;
use market_lib::models::stock_price::StockPrice;
use market_lib::utils::alpha_vantage::query_daily_time_adjusted;


mod setup;

async fn update_prices() {

    use market_lib::schema::stock_assets::dsl::*;


    let connection = setup::establish_connection();
    let api_key = setup::get_api_key();
    let results = stock_assets
        .limit(5)
        .load::<StockAsset>(&connection)
        .expect("Error loading stock assets");

    println!("Displaying {} stock assets", results.len());

    for stock in results {
        println!("{} at {} queried as {}", stock.symbol, stock.exchange, stock.query_symbol);
        let response = query_daily_time_adjusted(&stock.query_symbol, &api_key).await;
        match response {
            Ok(av_time_response) => {
                StockPrice::from_av_time_response(av_time_response, stock);
            }
            Err(e) => {
                println!("We were unable to get {} stock details because {}", stock.query_symbol, e);

            }
        };
    }
}

#[tokio::main]
async fn main() {
    update_prices().await;
}
