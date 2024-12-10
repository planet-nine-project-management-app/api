Rails.application.config.middleware.insert_before 0, Rack::Cors do
  allow do
    origins ENV['FRONTEND_URL']  # Front-end URL
    resource '*',
    headers: :any,
    methods: [:get, :post, :put, :patch, :delete, :options]
  end
end
