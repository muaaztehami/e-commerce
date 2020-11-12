#gives ability to list certain abilities
#passing cookies b/w front and back so we need a tool cridentials
# for credentials we need to specify rules

Rails.application.config.middleware.insert_before 0, Rack::Cors do
  allow do
    origins "http://localhost:3000" #frontend
    resource "*", headers: :any, methods: [:get, :post, :put, :patch, :delete, :options, :head],
    credentials: true
  end

  allow do
    origins "" #frontend heroku
    resource "*", headers: :any, methods: [:get, :post, :put, :patch, :delete, :options, :head],
    credentials: true
  end
end