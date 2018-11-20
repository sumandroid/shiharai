Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
 namespace :admin do
 	resources :transactions, only: [:index, :new, :create] do
 		collection do 
 			post "authenticate_razorpay_payment"
 		end
 	end
 end
end
