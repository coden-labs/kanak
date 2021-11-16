#![feature(proc_macro_hygiene, decl_macro)]

#[macro_use] extern crate rocket;

use rocket::tokio::time::{sleep, Duration};


#[get("/world")]
fn world() -> &'static str {
    "hello, world!"
}

#[get("/delay/<seconds>")]
async fn delay(seconds: u64) -> String {
    sleep(Duration::from_secs(seconds)).await;
    format!("Waited for {} seconds", seconds)
}


#[launch]
async fn rocket() -> rocket::Rocket<rocket::Build> {
    rocket::build()
        .mount("/hello", routes![world])
        .mount("/do", routes![delay])
}
