SimpleCov.start do
  add_group 'Models', 'app/models'
  add_group 'API', 'app/api'
  add_group 'Serializers', 'app/serializers'

  add_filter 'config'
  add_filter 'spec'
  add_filter 'app/jobs'
  add_filter 'app/channels'
  add_filter 'app/mailers'
  add_filter 'app/controllers'
end
