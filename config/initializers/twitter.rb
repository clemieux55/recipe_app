OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :twitter, ENV['Nl5j1wjMjEiwBb8OWFUA'], ENV['VErSvPFyFFGiTOkZs2CnEwT9YAyUHQAwPmQuVEni0']
end