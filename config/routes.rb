Rails.application.routes.draw do
  root 'main#index'

  get 'lxc/new' => 'lxcs#new_lxc_form'
  get 'lxc/updatestate/:id/:name/:actionstate' => 'lxcs#update_state_lxc'

  post 'lxc/new' => 'lxcs#store_new_lxc'
  get 'lxc/delete/:id' => 'lxcs#delete_lxc'

  get 'lxc-services/new/:id/:name' => 'lxcs#new_lxc_service_form'
  post 'lxc-services/config' => `lxc#show_lxc_services_table`
end
