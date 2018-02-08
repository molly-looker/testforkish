connection: "thelook"
label: "The Look"
include: "*.view.lkml"
include: "*.dashboard.lkml"

datagroup: molly_datagroup {
  max_cache_age: "4 hour"
}


explore: users {
  persist_with: molly_datagroup
  fields: [ALL_FIELDS*, -user_data.id]
  always_filter: {
    filters: {
      field: state
      value: "California"
    }
  }
  join: user_data {
    view_label: "extra user shiz"
    type: inner
    sql_on: ${users.id} = ${user_data.user_id};;
    relationship: one_to_one

  }

}

explore: orders {
  sql_always_where: ${created_date} >= '2017-01-01';;
  join: users {
    sql_on: ${orders.user_id} = ${users.id} ;;
    relationship: many_to_one
  }

  join: order_items {
    sql_on: ${order_items.order_id} = ${orders.id} ;;
    relationship: one_to_many
  }
}

explore: inventory_items {
join: Womens {
    from:  products
    view_label: "Women's Products"
    sql_on:  ${inventory_items.product_id}=${Womens.id} ;;
    relationship: many_to_one

}
  join: Mens {
    from:  products
    view_label: "Men's Products"
    sql_on:  ${inventory_items.product_id}=${Mens.id} ;;
      relationship: many_to_one


}
}
