extern crate time;

fn main() {
    println!("Hello World");

    // let is_friday: bool = false;
    // let now = time::get_time();
    // println!("now: {}", now.sec);
    let now = time::now_utc();
    println!("now: {}:{}:{}", now.tm_hour + 1, now.tm_min, now.tm_sec);

    // use chrono::{UTC, Local, DateTime};
    // let utc: DateTime<UTC> = UTC::now();
    // let local: DateTime<Local> = Local::now();
    let mut x = vec!["Hello"."world"];
}
