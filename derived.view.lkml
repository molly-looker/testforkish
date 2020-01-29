view: derived_des_aleks_pdt {
  derived_table: {

    sql: SELECT
        user_id as user_id
        , COUNT(*) as lifetime_orders
        , MAX(orders.created_at) as most_recent_purchase_at
      FROM orders
      GROUP BY user_id
      ;;
      sql_trigger_value: Select Max(today) ;;
      persist_for: "24 hours"
  }
#
  # Define your dimensions and measures here, like this:
  dimension: lifetime_orders {

    type: number
    sql: ${TABLE}.lifetime_orders ;;
  }
}
