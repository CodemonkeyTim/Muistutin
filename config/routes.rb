Muistutin::Application.routes.draw do
  match "/save_reminder/:id" => "ajax#save_reminder"
  match "/create_new" => "ajax#create_new"

  root :to => 'site#index'

end
