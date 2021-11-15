use futures::executor::block_on;
use std::time::Duration;
use async_std::task;

async fn update_prices() {
    loop {
        task::sleep(Duration::from_secs(10)).await;
        println!("Hello World");
    }
}

fn main() {
    block_on(update_prices());
}
