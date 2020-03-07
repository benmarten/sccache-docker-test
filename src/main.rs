use chrono::prelude::*;

fn main() {
    let dt = Utc.ymd(2014, 7, 8).and_hms(9, 10, 11);

    println!("Hello, world! It is: {}", dt);
}
