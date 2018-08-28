Rails.application.routes.draw do
  root 'main#index'

  get 'lxc/new' => 'lxcs#new_lxc_form'
  get 'lxc/updatestate/:id/:name/:actionstate' => 'lxcs#update_state_lxc'

  post 'lxc/new' => 'lxcs#store_new_lxc'
  get 'lxc/delete/:id' => 'lxcs#delete_lxc'

  get 'lxc-services/:lxc_id/:lxd_id' => 'lxcservices#index'
  get 'lxc-services/new/:lxc_id/:lxd_id' => 'lxcservices#new_lxc_service_form'
  post 'lxc-services/new/:lxc_id/:lxd_id' => 'lxcservices#store_new_lxc_service'
  
end
