require 'httparty'

class LxcservicesController < ApplicationController
    def index
        response = HTTParty.get(
          "#{Rails.application.config.scheduler_address}/lxc-services/lxc/#{params['lxc_id']}",
          :headers => {
            "Content-Type" => "application/json"
          }
        )
        @lxc_id = params['lxc_id']
        @lxd_id = params['lxd_id']    
        @lxc_service_list = JSON.parse(response.body)
    end

    def new_lxc_service_form

    end

    def store_new_lxc_service
      @result = HTTParty.post(
          "#{Rails.application.config.scheduler_address}/lxc-services",
          body: {
            service: params['service'],
            lxc_port: params['lxc_port'],
            lxc_id: params['lxc_id'],
            lxd_id: params['lxd_id'],
            lxd_port: params['lxd_port'],
          }.to_json,
          headers: {
            'Content-Type' => 'application/json',
          }
      )
  end
end
