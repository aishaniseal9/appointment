json.array! @hospitals do |hospital|
  json.id hospital.id
  json.name hospital.Hname.pg_search_highlight.html_safe
  