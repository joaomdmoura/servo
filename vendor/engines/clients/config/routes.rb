::Refinery::Application.routes.draw do
  resources :clients, :only => [:index, :show]

  scope(:path => 'refinery', :as => 'admin', :module => 'admin') do
    resources :clients, :except => :show do
      collection do
        post :update_positions
      end
    end
  end
end
