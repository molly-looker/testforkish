view: pdtttt {
   derived_table: {
    sql: select '10' as set, 1 as [in set]
    UNION
    select '20' as set, 2 as [in set]
    UNION
    select '10' as set, 3 as [in set];;
  }

  dimension: set  {
    type:  string
    sql: ${TABLE}.set ;;
  }

  dimension: in_set {
    type:  number
    sql:  ${TABLE}."in set" ;;
  }
  }

  explore: pdtttt {}
#
#   # Define your dimensions and measures here, like this:
#   dimension: user_id {
#     description: "Unique ID for each user that has ordered"
#     type: number
#     sql: ${TABLE}.user_id ;;
#   }
#
#   dimension: lifetime_orders {
#     description: "The total number of orders for each user"
#     type: number
#     sql: ${TABLE}.lifetime_orders ;;
#   }
#
#   dimension_group: most_recent_purchase {
#     description: "The date when each user last ordered"
#     type: time
#     timeframes: [date, week, month, year]
#     sql: ${TABLE}.most_recent_purchase_at ;;
#   }
#
#   measure: total_lifetime_orders {
#     description: "Use this for counting lifetime orders across many users"
#     type: sum
#     sql: ${lifetime_orders} ;;
#   }
# }
