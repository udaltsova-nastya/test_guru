Rails.application.routes.draw do
  get "/about", to: static("about.html")
  get "/about/author", to: static("author.html")
end
