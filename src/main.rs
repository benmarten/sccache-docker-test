use chrono::prelude::*;
use url::{ParseError, Url};

fn main() {
    let dt = Utc.ymd(2014, 7, 8).and_hms(9, 10, 11);
    assert!(Url::parse("http://[:::1]") == Err(ParseError::InvalidIpv6Address));
    println!("Hello, world! It is: {}", dt);
}
