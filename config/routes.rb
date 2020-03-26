Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
  root to: "toppages#index"
  
  get "login", to: "sessions#new"
  post "login", to: "sessions#create"
  delete "logout", to: "sessions#destroy"
  
  get "signup", to: "users#new"
  resources :users do
    member do
      get :likes
    end    
  end
  
  get "posts/muscle", to: "posts#muscle"  #「筋肉をつける」で「もっと見る」ボタンを押した際の投稿一覧
  get "posts/diet", to: "posts#diet"  #「痩せたい」で「もっと見る」ボタンを押した際の投稿一覧
  get "posts/food", to: "posts#food"  #「食事面」で「もっと見る」ボタンを押した際の投稿一覧
#通常の投稿一覧は以下のposts→indexindexアクションで表示、「もっと見る」ボタンを押したら上の3つのどれかを表示
  resources :posts
  
  resources :favorites, only: [:create, :destroy]
end
