# 7-Day Rolling Conversion Rate & Anomaly Detection

## 1. Problem Statement
Daily e-commerce web traffic and conversion metrics often exhibit high noise and day-of-week seasonality (e.g., user behavior differing between weekdays and weekends). Relying on raw single-day conversion rates can trigger false alarms or obscure genuine performance crashes. 

To solve this, we track a **7-day rolling conversion rate** and perform a **Week-over-Week (WoW) comparison**. Any page experiencing a rolling conversion rate drop of **more than 20%** compared to exactly one week prior is automatically flagged for investigation.

---

## 2. Database Schema
The analysis runs on a single table named `traffic_data`:

* **`date`** (`DATE`): The calendar date of the log.
* **`page`** (`VARCHAR`): The identifier/slug for the product page (e.g., `winter-boots`, `rain-jackets`).
* **`visits`** (`INT`): Total number of visitors to the page on that day.
* **`conversions`** (`INT`): Total number of visitors who completed a goal/purchase on that day.

---

## 3. Algorithm & Logic Flow

The algorithm uses PostgreSQL window functions to compute metrics efficiently without complex self-joins:

1. **Sliding Window Aggregation:** For each row, calculate the sum of visits and conversions over a 7-day window (`ROWS BETWEEN 6 PRECEDING AND CURRENT ROW`) partitioned by page.
2. **Current Rate Calculation:** Divide the rolling 7-day conversions by rolling 7-day visits.
3. **Historical Lookback:** Use the `LAG(..., 7)` window function to fetch the rolling conversion rate from exactly 7 days prior.
4. **WoW Percentage Change & Flagging:** Compute the relative percentage change and filter for drops strictly less than `-0.20` (-20%).
