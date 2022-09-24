Rails.application.config.generators do |g|
  g.test_framework :rspec
  g.fixtures         false
  g.view_specs       false
  g.helper_specs     false
  g.routing_specs    false
  g.request_specs    false
  g.controller_specs false
end
