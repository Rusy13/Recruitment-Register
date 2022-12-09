Rails.application.routes.draw do
  devise_for :usercustomers
  devise_for :userexecutors
  root 'open#page1', as: 'home'
  get 'open/page1'
  get 'open/page2'
  get 'open/pageinreg1', as: 'cus'
  get 'open/pageinreg2', as: 'exe'
end
