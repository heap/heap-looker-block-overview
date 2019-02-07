view: users {
  sql_table_name: main_production.users ;;

  dimension: user_id {
    primary_key: yes
    type: number
    sql: ${TABLE}.user_id ;;
  }

  dimension: identity {
    sql: ${TABLE}."identity" ;;
  }
### add additional user properties here based on their column name to drill down on additional user properties
  dimension_group: joindate {
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.joindate ;;
  }

  measure: count {
    hidden: yes
    type: count
    drill_fields: [detail*]
  }

  # ----- Sets of fields for drilling ------
  set: detail {
    fields: [user_id, identity, sessions.count, joindate_date]
  }
}
