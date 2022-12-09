Rails.application.routes.draw do
  devise_for :usercustomers
  devise_for :userexecutors
  root 'open#page1', as: 'home'
  get 'open/page1'
  get 'open/page2'
end
