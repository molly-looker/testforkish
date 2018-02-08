view: inventory_items {
  sql_table_name: demo_db.inventory_items ;;

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: product_id {
    type:  number
    hidden:  yes
    sql: ${TABLE}.product_id ;;
  }
  dimension: cost {
    type: number
    sql: ${TABLE}.cost ;;
    value_format_name: usd
  }

  dimension: cost_tier {
    type: tier
    tiers: [0, 10, 30, 50, 80, 100]
    style: relational
    sql: ${cost} ;;
    drill_fields: [product_id, cost]
  }

  dimension_group: created {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.created_at ;;
  }


  dimension_group: sold {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.sold_at ;;
  }

  measure: count {
    type: count
    drill_fields: [products.item_name]
  }

  measure: count_brands_women {
    type:  count_distinct
    sql: womens_products.brands ;;
  }

  measure: count_brands_men {
    type:  count_distinct
    sql: mens_products.brands ;;
  }


  measure: count_CK_womens {
    type: count
    filters: {
      field: womens_products.brand
      value: "Calvin Klein Jeans"
  }
    drill_fields: [products.product_id, products.item_name]
}

  measure: count_CK_mens {
    type: count
    filters: {
      field: mens_products.brand
      value: "Calvin Klein Jeans"
    }
    drill_fields: [products.product_id, products.item_name]
  }


  measure: percentCK {
    type:  percent_of_total
    sql:  (${count_CK_womens}+ ${count_CK_mens})/${count} ;;
    drill_fields: [count, count_CK_mens, count_CK_womens]
    }
}
