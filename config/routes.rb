Rails.application.routes.draw do
  devise_for :users
  resources :posts do
    resources :comments
  end
  root 'posts#index'
  mount KnowledgeBase::Engine, at: '/knowledge_base' 
end
