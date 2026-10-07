-- =====================================================================
-- Project: 7-Day Rolling Conversion Rate & WoW Drop Detection
-- File: feed.sql
-- Description: Creates the traffic_data table and loads September dataset
-- =====================================================================

DROP TABLE IF EXISTS traffic_data;

-- Create the traffic data table
CREATE TABLE traffic_data (
    date DATE NOT NULL,
    page VARCHAR(100) NOT NULL,
    visits INT NOT NULL,
    conversions INT NOT NULL,
    PRIMARY KEY (date, page)
);

-- Insert full month dataset (Sept 1 – Sept 30)
INSERT INTO traffic_data (date, page, visits, conversions) VALUES
-- Sept 1
('2026-09-01', 'winter-boots', 950, 48),
('2026-09-01', 'rain-jackets', 780, 39),
-- Sept 2
('2026-09-02', 'winter-boots', 1020, 51),
('2026-09-02', 'rain-jackets', 810, 41),
-- Sept 3
('2026-09-03', 'winter-boots', 990, 50),
('2026-09-03', 'rain-jackets', 790, 40),
-- Sept 4
('2026-09-04', 'winter-boots', 1040, 52),
('2026-09-04', 'rain-jackets', 820, 41),
-- Sept 5
('2026-09-05', 'winter-boots', 970, 49),
('2026-09-05', 'rain-jackets', 800, 40),
-- Sept 6
('2026-09-06', 'winter-boots', 1010, 51),
('2026-09-06', 'rain-jackets', 830, 42),
-- Sept 7
('2026-09-07', 'winter-boots', 1000, 50),
('2026-09-07', 'rain-jackets', 790, 39),
-- Sept 8
('2026-09-08', 'winter-boots', 980, 49),
('2026-09-08', 'rain-jackets', 800, 40),
-- Sept 9
('2026-09-09', 'winter-boots', 1030, 52),
('2026-09-09', 'rain-jackets', 810, 41),
-- Sept 10
('2026-09-10', 'winter-boots', 990, 50),
('2026-09-10', 'rain-jackets', 780, 39),
-- Sept 11
('2026-09-11', 'winter-boots', 1050, 53),
('2026-09-11', 'rain-jackets', 820, 41),
-- Sept 12
('2026-09-12', 'winter-boots', 960, 48),
('2026-09-12', 'rain-jackets', 790, 40),
-- Sept 13
('2026-09-13', 'winter-boots', 1000, 50),
('2026-09-13', 'rain-jackets', 800, 40),
-- Sept 14
('2026-09-14', 'winter-boots', 1020, 51),
('2026-09-14', 'rain-jackets', 810, 41),
-- Sept 15
('2026-09-15', 'winter-boots', 990, 50),
('2026-09-15', 'rain-jackets', 790, 40),
-- Sept 16
('2026-09-16', 'winter-boots', 1040, 52),
('2026-09-16', 'rain-jackets', 820, 41),
-- Sept 17
('2026-09-17', 'winter-boots', 1000, 50),
('2026-09-17', 'rain-jackets', 800, 40),
-- Sept 18
('2026-09-18', 'winter-boots', 1050, 53),
('2026-09-18', 'rain-jackets', 820, 41),
-- Sept 19
('2026-09-19', 'winter-boots', 980, 49),
('2026-09-19', 'rain-jackets', 790, 40),
-- Sept 20
('2026-09-20', 'winter-boots', 1020, 51),
('2026-09-20', 'rain-jackets', 810, 41),
-- Sept 21
('2026-09-21', 'winter-boots', 1000, 50),
('2026-09-21', 'rain-jackets', 800, 40),
-- Sept 22
('2026-09-22', 'winter-boots', 1100, 55),
('2026-09-22', 'rain-jackets', 830, 42),
-- Sept 23
('2026-09-23', 'winter-boots', 950, 48),
('2026-09-23', 'rain-jackets', 780, 39),
-- Sept 24
('2026-09-24', 'winter-boots', 1000, 50),
('2026-09-24', 'rain-jackets', 800, 28),
-- Sept 25
('2026-09-25', 'winter-boots', 1030, 51),
('2026-09-25', 'rain-jackets', 820, 25),
-- Sept 26
('2026-09-26', 'winter-boots', 990, 50),
('2026-09-26', 'rain-jackets', 790, 24),
-- Sept 27
('2026-09-27', 'winter-boots', 1010, 51),
('2026-09-27', 'rain-jackets', 810, 26),
-- Sept 28
('2026-09-28', 'winter-boots', 1040, 52),
('2026-09-28', 'rain-jackets', 800, 25),
-- Sept 29
('2026-09-29', 'winter-boots', 970, 49),
('2026-09-29', 'rain-jackets', 830, 27),
-- Sept 30
('2026-09-30', 'winter-boots', 1000, 50),
('2026-09-30', 'rain-jackets', 780, 23);
