Rails.application.routes.draw do

  get '/' => 'admin#index'
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

  get '/site/new' => 'site#new'
  post '/site/create' => 'site#create'
  get '/site/:id' => 'site#show'
  delete '/site/delete/:id' => 'site#delete'
  post '/site/edit/:id' => 'site#edit'

  get '/employee/new' => 'employee#new_emp'
  post '/employee/create' => 'employee#create'
  get '/employee/:id' => 'employee#show'
  post '/employee/edit/:id' => 'employee#edit'
  delete '/employee/delete/:id' => 'employee#delete'

  get '/timesheet/new' => 'timesheet#new'
  post 'timesheet/create' => 'timesheet#create'
  get '/timesheet/view/:id' => 'timesheet#view'
  get '/timesheet/hours' => 'timesheet#hours'


end
