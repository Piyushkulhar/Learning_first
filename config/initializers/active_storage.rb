Rails.application.config.after_initialize do
    Rails.application.routes.default_url_options[:host] = 'localhost:3000'
end
  
