Rails.application.routes.draw do
  scope "(:locale)",locale: /#{I18n.available_locales.join("|")}/ do
    get 'userexecutors/show'
    get 'usercustomers/show'


    get 'checkout', to: 'checkouts#show'
    get 'checkout/success', to: 'checkouts#success'
    get 'billing', to: 'billing#show'

    resources :rooms do
    resources :messages
    end

    devise_for :usercustomers
    # devise_for :userexecutors

    devise_for :userexecutors, controllers:{
    sessions: 'userexecutors/sessions',
    registrations: 'userexecutors/registrations'
    }

    root 'open#after_registrationexe'



    devise_scope :usercustomer do
    get 'usercustomers',to: 'devise/sessions#new'
    end


    # resources :open




    # get '/userexecutors/default_profile.jpg'
    get 'open/page1'
    get 'open/page2'
    get 'open/pageinreg1', as: 'cus'
    get 'open/pageinreg2', as: 'exe'
    get 'open/after_registrationcus',to:"open#after_registrationcus", as: 'afteregcus'
    get 'open/after_registrationexe',to:"open#after_registrationexe", as: 'afteregexe'
    get 'open/addinfocus' ,to:"open#addinfocus", as: 'addcusinfo'
    get '/addinfocus', to: "open#addinfocus" 
    get 'open/addinfoexe' ,to:"open#addinfoexe", as: 'addexeinfo'
    get '/addinfoexe', to: "open#addinfoexe" 
    get 'open/addexecutorreq' ,to:"open#addexecutorreq", as: 'addexereq'
    get '/addexecutorreq', to: "open#addexecutorreq" 

    get 'userexecutor/:id', to: 'userexecutors#show', as: 'userexecutor'
    get 'usercustomer/:id', to: 'usercustomers#show', as: 'usercustomer'
  end
end