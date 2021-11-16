use futures::executor::block_on;
use std::time::Duration;
use async_std::task;

use diesel::prelude::*;
use market_lib::models::stock_asset::StockAsset;

mod setup;

async fn update_prices() {

    use market_lib::schema::stock_assets::dsl::*;


    let connection = setup::establish_connection();
    let results = stock_assets
        .limit(5)
        .load::<StockAsset>(&connection)
        .expect("Error loading stock assets");

    println!("Displaying {} stock assets", results.len());

    for stock in results {
        task::sleep(Duration::from_secs(10)).await;
        println!("{} at {} queried as {}", stock.symbol, stock.exchange, stock.query_symbol);
    }
}

fn main() {
    block_on(update_prices());
}
