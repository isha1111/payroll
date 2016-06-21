Rails.application.routes.draw do

  get '/' => 'admin#index'
  get '/recover' => 'admin#recover'
  post '/recover/confirm' => 'admin#confirm'
  get '/resetPassword/:email' => 'admin#update',:constraints => { :email => /.+@.+\..*/ }
  post '/resetPassword/update' => 'admin#update_password'
  get '/EAST-WEST-Employees' => 'admin#employee_data' , :as => :employees
  get '/EAST-WEST-Sites' => 'admin#site_data' , :as => :sites
  post '/submit' => 'admin#submit'
  get '/services' => 'admin#services'
  get '/contact' => 'admin#contact'
  get '/adminlogin' => 'admin#login_admin'
  get '/admin/login' => 'admin#main'
  get '/admin/new' => 'admin#new_admin'
  post '/admin/create' => 'admin#create'

  post '/session/admin' => 'session#create_admin'
  post '/delete/admin' => 'session#delete_admin'
  post '/session/emp' => 'session#session_emp'
  post '/delete/emp' => 'session#delete_emp'

  get '/userlogin' => 'user#login_user'
  get '/user/new' => 'user#new_user'
  post '/user/create' => 'user#create'
  get '/user/login' => 'user#main'

  get '/site/new' => 'site#new'
  post '/site/create' => 'site#create'
  get '/site/:id' => 'site#show'
  delete '/site/delete/:id' => 'site#delete'
  post '/site/edit/:id' => 'site#edit'
  get '/site/employee' => 'site#employee'
  get 'site/employee/:id' => 'site#view_emp'


  get '/employee/new' => 'employee#new_emp'
  post '/employee/create' => 'employee#create'
  get '/employee/:id' => 'employee#show'
  post '/employee/edit/:id' => 'employee#edit'
  delete '/employee/delete/:id' => 'employee#delete'

  get '/timesheet/new' => 'timesheet#new'
  post 'timesheet/create' => 'timesheet#create'
  get '/timesheet/view/:id' => 'timesheet#view'
  get '/timesheet/hours' => 'timesheet#hours'
  post '/timesheet/save' => 'timesheet#save'
  get '/timesheet/days' => 'timesheet#days'
  get '/timesheet/edit' => 'timesheet#edit'
  get '/timesheet/check' => 'timesheet#check'
  get '/timesheet/delete/:id' => 'timesheet#delete'

end
