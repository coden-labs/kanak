use log;

use crate::utils::response_dto::AVTimeResponse;


async fn raw_query(api_method: &String, query_symbol: &String, api_key: &String) -> Result<AVTimeResponse, Box<dyn std::error::Error>>  {
    let request_url = format!(
        "https://www.alphavantage.co/query?function={api_method}&symbol={query_symbol}&outputsize=full&apikey={api_key}",
        api_method = api_method,
        query_symbol = query_symbol,
        api_key = api_key
    );
    log::info!("Querying {}", request_url);
    let response = reqwest::get(&request_url).await?.json::<AVTimeResponse>().await?;
    Ok(response)
}

pub async fn query_daily_time_unadjusted(query_symbol: &String, api_key: &String) -> Result<AVTimeResponse, Box<dyn std::error::Error>> {
    let method = String::from("TIME_SERIES_DAILY");
    let response = raw_query(&method, &query_symbol, &api_key).await?;
    Ok(response)
}
