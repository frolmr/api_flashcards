ApiFlashcards::Engine.routes.draw do
  get 'test', to: 'test#test'

  scope module: :api do
    namespace :v1 do
      post :cards, to: 'cards#create'
      get :cards, to: 'cards#index'
      post 'review', to: 'cards#review'
    end
  end
end
