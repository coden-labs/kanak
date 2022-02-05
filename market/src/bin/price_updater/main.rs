use diesel::prelude::*;
use market_lib::models::stock_assets::StockAsset;
use market_lib::models::stock_prices::StockPrice;
use market_lib::utils::alpha_vantage::query_daily_time_unadjusted;


mod setup;

async fn update_prices() {

    use market_lib::schema::stock_assets::dsl::*;
    use market_lib::schema::stock_prices::dsl::*;


    let connection = setup::establish_connection();
    let api_key = setup::get_api_key();
    let results = stock_assets
        .limit(5)
        .load::<StockAsset>(&connection)
        .expect("Error loading stock assets");

    println!("Displaying {} stock assets", results.len());

    for stock in results {
        println!("{} at {} queried as {}", stock.symbol, stock.exchange, stock.query_symbol);
        let response = query_daily_time_unadjusted(&stock.query_symbol, &api_key).await;
        match response {
            Ok(av_time_response) => {
                let stock_price_info = StockPrice::from_av_time_response(av_time_response, &stock, false);
                for stock_price in stock_price_info {
                    let inserted_prices = diesel::insert_into(stock_prices)
                        .values(&stock_price)
                        .on_conflict_do_nothing()
                        .execute(&connection);
                    match inserted_prices {
                        Ok(size) => {
                            println!("Inserted as many value {}", size);
                        }
                        Err(e) => {
                            println!("We were unable to insert {} stock details because {}", stock_price.query_symbol, e);
                        }
                    }
                }
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
