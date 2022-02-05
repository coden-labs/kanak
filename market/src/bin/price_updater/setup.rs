use diesel::prelude::*;
use diesel::pg::PgConnection;
use dotenv::dotenv;
use std::env;


pub fn establish_connection() -> PgConnection {
    dotenv().ok();

    let database_url = env::var("DATABASE_URL")
        .expect("must be set");
    PgConnection::establish(&database_url)
        .expect(&format!("Error connection to {}", database_url))
}

pub fn get_api_key() -> String {
    dotenv().ok();

    let api_key = env::var("ALPHA_VANTAGE_KEY").expect("must be set");
    api_key
}

pub fn get_log_level() -> String {
    dotenv().ok();

    let log_level = env::var("LOG_LEVEL").expect("must be set");
    log_level
}