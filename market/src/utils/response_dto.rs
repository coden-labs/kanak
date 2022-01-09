use std::collections::HashMap;
use std::collections::BTreeMap;
use serde;

#[derive(Debug, serde::Deserialize)]
pub struct AVTimeResponse{
    #[serde(alias = "Meta Data")]
    pub meta_data: HashMap<String, String>,
    #[serde(alias = "Time Series (Daily)")]
    pub time_series_daily: BTreeMap<String, HashMap<String, String>>,
}
