view: derived {
  derived_table: {
    sql_trigger_value: select ${derived2.lifetime_orders} ;;
    sql: SELECT
        user_id as user_id
        , COUNT(*) as lifetime_orders
        , MAX(orders.created_at) as most_recent_purchase_at
      FROM orders
      GROUP BY user_id
      ;;
  }
#
  # Define your dimensions and measures here, like this:
  dimension: lifetime_orders {

    type: number
    sql: ${TABLE}.lifetime_orders ;;
  }
}
