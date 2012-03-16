Muistutin::Application.routes.draw do
  match "/save_reminder/:id" => "ajax#save_reminder"
  match "/delete_reminder/:id" => "ajax#delete_reminder"
  match "/create_new" => "ajax#create_new"
  match "/update_table" => "ajax#update_table"
  
  root :to => 'site#index'

end
