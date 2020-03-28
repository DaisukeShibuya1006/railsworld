Rails.application.routes.draw do
  get '/posts' => "post#index"
  root 'application#goodbye'
end
