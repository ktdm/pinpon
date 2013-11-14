Pinpon::Application.routes.draw do

  root :to => "words#index"
  resources :words, :only => [:index, :show] do
    post "index"
  end
  [:words, :equivalences, :explanations, :suggestions].each do |model|
    resources model do
      member do
        get "vote"
      end
    end
  end

end
