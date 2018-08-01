Rails.application.routes.draw do
  resources :text_messages, except: [:edit, :update, :destroy]
  resources :train_statuses, except: [:new, :edit, :update, :destroy] do
    collection do
        post 'reply'
    end
  end
  root "train_statuses#create"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
