view: orders {
  sql_table_name: demo_db.orders ;;


  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
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

  dimension: status {
    type: string
    sql: ${TABLE}.status ;;
  }

  dimension: is_complete{
    type: yesno
    sql: ${status} = 'complete' ;;
  }

  dimension: user_id {
    type: number
    hidden: yes
    sql: ${TABLE}.user_id ;;
    drill_fields: [users.first_name, users.last_name]
  }

  measure: count {
    type: count
    drill_fields: [id, users.name, order_items.count]
  }

  measure: hardcode {
    type: number
    sql:  '0.03' ;;
  }
}
