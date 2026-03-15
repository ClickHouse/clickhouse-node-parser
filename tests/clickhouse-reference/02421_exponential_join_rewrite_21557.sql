CREATE TABLE store_sales
(
    `ss_sold_date_sk` Nullable(Int64),
    `ss_sold_time_sk` Nullable(Int64),
    `ss_item_sk` Int64,
    `ss_customer_sk` Nullable(Int64),
    `ss_cdemo_sk` Nullable(Int64),
    `ss_hdemo_sk` Nullable(Int64),
    `ss_addr_sk` Nullable(Int64),
    `ss_store_sk` Nullable(Int64),
    `ss_promo_sk` Nullable(Int64),
    `ss_ticket_number` Int64,
    `ss_quantity` Nullable(Int64),
    `ss_wholesale_cost` Nullable(Float32),
    `ss_list_price` Nullable(Float32),
    `ss_sales_price` Nullable(Float32),
    `ss_ext_discount_amt` Nullable(Float32),
    `ss_ext_sales_price` Nullable(Float32),
    `ss_ext_wholesale_cost` Nullable(Float32),
    `ss_ext_list_price` Nullable(Float32),
    `ss_ext_tax` Nullable(Float32),
    `ss_coupon_amt` Nullable(Float32),
    `ss_net_paid` Nullable(Float32),
    `ss_net_paid_inc_tax` Nullable(Float32),
    `ss_net_profit` Nullable(Float32),
    `ss_promo_sk_nn` Int16,
    `ss_promo_sk_n2` Nullable(Int16)
)
ENGINE = MergeTree ORDER BY (ss_item_sk, ss_ticket_number);
CREATE TABLE store_returns
(
    `sr_returned_date_sk` Nullable(Int64),
    `sr_return_time_sk` Nullable(Int64),
    `sr_item_sk` Int64,
    `sr_customer_sk` Nullable(Int64),
    `sr_cdemo_sk` Nullable(Int64),
    `sr_hdemo_sk` Nullable(Int64),
    `sr_addr_sk` Nullable(Int64),
    `sr_store_sk` Nullable(Int64),
    `sr_reason_sk` Nullable(Int64),
    `sr_ticket_number` Int64,
    `sr_return_quantity` Nullable(Int64),
    `sr_return_amt` Nullable(Float32),
    `sr_return_tax` Nullable(Float32),
    `sr_return_amt_inc_tax` Nullable(Float32),
    `sr_fee` Nullable(Float32),
    `sr_return_ship_cost` Nullable(Float32),
    `sr_refunded_cash` Nullable(Float32),
    `sr_reversed_charge` Nullable(Float32),
    `sr_store_credit` Nullable(Float32),
    `sr_net_loss` Nullable(Float32)
)
ENGINE = MergeTree ORDER BY (sr_item_sk, sr_ticket_number);
CREATE TABLE catalog_sales
(
    `cs_sold_date_sk` Nullable(Int64),
    `cs_sold_time_sk` Nullable(Int64),
    `cs_ship_date_sk` Nullable(Int64),
    `cs_bill_customer_sk` Nullable(Int64),
    `cs_bill_cdemo_sk` Nullable(Int64),
    `cs_bill_hdemo_sk` Nullable(Int64),
    `cs_bill_addr_sk` Nullable(Int64),
    `cs_ship_customer_sk` Nullable(Int64),
    `cs_ship_cdemo_sk` Nullable(Int64),
    `cs_ship_hdemo_sk` Nullable(Int64),
    `cs_ship_addr_sk` Nullable(Int64),
    `cs_call_center_sk` Nullable(Int64),
    `cs_catalog_page_sk` Nullable(Int64),
    `cs_ship_mode_sk` Nullable(Int64),
    `cs_warehouse_sk` Nullable(Int64),
    `cs_item_sk` Int64,
    `cs_promo_sk` Nullable(Int64),
    `cs_order_number` Int64,
    `cs_quantity` Nullable(Int64),
    `cs_wholesale_cost` Nullable(Float32),
    `cs_list_price` Nullable(Float32),
    `cs_sales_price` Nullable(Float32),
    `cs_ext_discount_amt` Nullable(Float32),
    `cs_ext_sales_price` Nullable(Float32),
    `cs_ext_wholesale_cost` Nullable(Float32),
    `cs_ext_list_price` Nullable(Float32),
    `cs_ext_tax` Nullable(Float32),
    `cs_coupon_amt` Nullable(Float32),
    `cs_ext_ship_cost` Nullable(Float32),
    `cs_net_paid` Nullable(Float32),
    `cs_net_paid_inc_tax` Nullable(Float32),
    `cs_net_paid_inc_ship` Nullable(Float32),
    `cs_net_paid_inc_ship_tax` Nullable(Float32),
    `cs_net_profit` Nullable(Float32)
)
ENGINE = MergeTree ORDER BY (cs_item_sk, cs_order_number);
CREATE TABLE catalog_returns
(
    `cr_returned_date_sk` Nullable(Int64),
    `cr_returned_time_sk` Nullable(Int64),
    `cr_item_sk` Int64,
    `cr_refunded_customer_sk` Nullable(Int64),
    `cr_refunded_cdemo_sk` Nullable(Int64),
    `cr_refunded_hdemo_sk` Nullable(Int64),
    `cr_refunded_addr_sk` Nullable(Int64),
    `cr_returning_customer_sk` Nullable(Int64),
    `cr_returning_cdemo_sk` Nullable(Int64),
    `cr_returning_hdemo_sk` Nullable(Int64),
    `cr_returning_addr_sk` Nullable(Int64),
    `cr_call_center_sk` Nullable(Int64),
    `cr_catalog_page_sk` Nullable(Int64),
    `cr_ship_mode_sk` Nullable(Int64),
    `cr_warehouse_sk` Nullable(Int64),
    `cr_reason_sk` Nullable(Int64),
    `cr_order_number` Int64,
    `cr_return_quantity` Nullable(Int64),
    `cr_return_amount` Nullable(Float32),
    `cr_return_tax` Nullable(Float32),
    `cr_return_amt_inc_tax` Nullable(Float32),
    `cr_fee` Nullable(Float32),
    `cr_return_ship_cost` Nullable(Float32),
    `cr_refunded_cash` Nullable(Float32),
    `cr_reversed_charge` Nullable(Float32),
    `cr_store_credit` Nullable(Float32),
    `cr_net_loss` Nullable(Float32)
)
ENGINE = MergeTree ORDER BY (cr_item_sk, cr_order_number);
CREATE TABLE date_dim
(
    `d_date_sk` Int64,
    `d_date_id` String,
    `d_date` Nullable(Date),
    `d_month_seq` Nullable(Int64),
    `d_week_seq` Nullable(Int64),
    `d_quarter_seq` Nullable(Int64),
    `d_year` Nullable(Int64),
    `d_dow` Nullable(Int64),
    `d_moy` Nullable(Int64),
    `d_dom` Nullable(Int64),
    `d_qoy` Nullable(Int64),
    `d_fy_year` Nullable(Int64),
    `d_fy_quarter_seq` Nullable(Int64),
    `d_fy_week_seq` Nullable(Int64),
    `d_day_name` Nullable(String),
    `d_quarter_name` Nullable(String),
    `d_holiday` Nullable(String),
    `d_weekend` Nullable(String),
    `d_following_holiday` Nullable(String),
    `d_first_dom` Nullable(Int64),
    `d_last_dom` Nullable(Int64),
    `d_same_day_ly` Nullable(Int64),
    `d_same_day_lq` Nullable(Int64),
    `d_current_day` Nullable(String),
    `d_current_week` Nullable(String),
    `d_current_month` Nullable(String),
    `d_current_quarter` Nullable(String),
    `d_current_year` Nullable(String)
)
ENGINE = MergeTree ORDER BY d_date_sk;
CREATE TABLE store
(
    `s_store_sk` Int64,
    `s_store_id` String,
    `s_rec_start_date` Nullable(Date),
    `s_rec_end_date` Nullable(Date),
    `s_closed_date_sk` Nullable(Int64),
    `s_store_name` Nullable(String),
    `s_number_employees` Nullable(Int64),
    `s_floor_space` Nullable(Int64),
    `s_hours` Nullable(String),
    `s_manager` Nullable(String),
    `s_market_id` Nullable(Int64),
    `s_geography_class` Nullable(String),
    `s_market_desc` Nullable(String),
    `s_market_manager` Nullable(String),
    `s_division_id` Nullable(Int64),
    `s_division_name` Nullable(String),
    `s_company_id` Nullable(Int64),
    `s_company_name` Nullable(String),
    `s_street_number` Nullable(String),
    `s_street_name` Nullable(String),
    `s_street_type` Nullable(String),
    `s_suite_number` Nullable(String),
    `s_city` Nullable(String),
    `s_county` Nullable(String),
    `s_state` Nullable(String),
    `s_zip` Nullable(String),
    `s_country` Nullable(String),
    `s_gmt_offset` Nullable(Float32),
    `s_tax_percentage` Nullable(Float32)
)
ENGINE = MergeTree ORDER BY s_store_sk;
CREATE TABLE customer
(
    `c_customer_sk` Int64,
    `c_customer_id` String,
    `c_current_cdemo_sk` Nullable(Int64),
    `c_current_hdemo_sk` Nullable(Int64),
    `c_current_addr_sk` Nullable(Int64),
    `c_first_shipto_date_sk` Nullable(Int64),
    `c_first_sales_date_sk` Nullable(Int64),
    `c_salutation` Nullable(String),
    `c_first_name` Nullable(String),
    `c_last_name` Nullable(String),
    `c_preferred_cust_flag` Nullable(String),
    `c_birth_day` Nullable(Int64),
    `c_birth_month` Nullable(Int64),
    `c_birth_year` Nullable(Int64),
    `c_birth_country` Nullable(String),
    `c_login` Nullable(String),
    `c_email_address` Nullable(String),
    `c_last_review_date` Nullable(String)
)
ENGINE = MergeTree ORDER BY c_customer_sk;
CREATE TABLE customer_demographics
(
    `cd_demo_sk` Int64,
    `cd_gender` Nullable(String),
    `cd_marital_status` Nullable(String),
    `cd_education_status` Nullable(String),
    `cd_purchase_estimate` Nullable(Int64),
    `cd_credit_rating` Nullable(String),
    `cd_dep_count` Nullable(Int64),
    `cd_dep_employed_count` Nullable(Int64),
    `cd_dep_college_count` Nullable(Int64)
)
ENGINE = MergeTree ORDER BY cd_demo_sk;
CREATE TABLE promotion
(
    `p_promo_sk` Int64,
    `p_promo_id` String,
    `p_start_date_sk` Nullable(Int64),
    `p_end_date_sk` Nullable(Int64),
    `p_item_sk` Nullable(Int64),
    `p_cost` Nullable(Float64),
    `p_response_target` Nullable(Int64),
    `p_promo_name` Nullable(String),
    `p_channel_dmail` Nullable(String),
    `p_channel_email` Nullable(String),
    `p_channel_catalog` Nullable(String),
    `p_channel_tv` Nullable(String),
    `p_channel_radio` Nullable(String),
    `p_channel_press` Nullable(String),
    `p_channel_event` Nullable(String),
    `p_channel_demo` Nullable(String),
    `p_channel_details` Nullable(String),
    `p_purpose` Nullable(String),
    `p_discount_active` Nullable(String)
)
ENGINE = MergeTree ORDER BY p_promo_sk;
CREATE TABLE household_demographics
(
    `hd_demo_sk` Int64,
    `hd_income_band_sk` Nullable(Int64),
    `hd_buy_potential` Nullable(String),
    `hd_dep_count` Nullable(Int64),
    `hd_vehicle_count` Nullable(Int64)
)
ENGINE = MergeTree ORDER BY hd_demo_sk;
CREATE TABLE customer_address
(
    `ca_address_sk` Int64,
    `ca_address_id` String,
    `ca_street_number` Nullable(String),
    `ca_street_name` Nullable(String),
    `ca_street_type` Nullable(String),
    `ca_suite_number` Nullable(String),
    `ca_city` Nullable(String),
    `ca_county` Nullable(String),
    `ca_state` Nullable(String),
    `ca_zip` Nullable(String),
    `ca_country` Nullable(String),
    `ca_gmt_offset` Nullable(Float32),
    `ca_location_type` Nullable(String)
)
ENGINE = MergeTree ORDER BY ca_address_sk;
CREATE TABLE income_band
(
    `ib_income_band_sk` Int64,
    `ib_lower_bound` Nullable(Int64),
    `ib_upper_bound` Nullable(Int64)
)
ENGINE = MergeTree ORDER BY ib_income_band_sk;
CREATE TABLE item
(
    `i_item_sk` Int64,
    `i_item_id` String,
    `i_rec_start_date` Nullable(Date),
    `i_rec_end_date` Nullable(Date),
    `i_item_desc` Nullable(String),
    `i_current_price` Nullable(Float32),
    `i_wholesale_cost` Nullable(Float32),
    `i_brand_id` Nullable(Int64),
    `i_brand` Nullable(String),
    `i_class_id` Nullable(Int64),
    `i_class` Nullable(String),
    `i_category_id` Nullable(Int64),
    `i_category` Nullable(String),
    `i_manufact_id` Nullable(Int64),
    `i_manufact` Nullable(String),
    `i_size` Nullable(String),
    `i_formulation` Nullable(String),
    `i_color` Nullable(String),
    `i_units` Nullable(String),
    `i_container` Nullable(String),
    `i_manager_id` Nullable(Int64),
    `i_product_name` Nullable(String)
)
ENGINE = MergeTree ORDER BY i_item_sk;
-- `parallel_hash` uses two-level hash tables (that have 256 tables internally).
-- it preallocates too much data as the result and memory exception occurs.
SET join_algorithm = 'hash';
