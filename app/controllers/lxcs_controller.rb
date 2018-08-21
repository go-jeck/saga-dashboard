require 'httparty'

class LxcsController < ApplicationController
    def new_lxc_form

    end

    def store_new_lxc
        puts `===> #{Rails.application.config}`
        @result = HTTParty.post(
            "http://172.28.128.5:9300/api/v1/lxc",
            body: {
              name: params['name'],
              type: Rails.application.config.lxc_type,
              protocol: Rails.application.config.lxc_protocol,
              server: Rails.application.config.lxc_server,
              alias: params['alias'],
              weight: params['weight'],
              weightValue: params['weightValue'].to_f
            }.to_json,
            headers: {
              'Content-Type' => 'application/json',
            }
        )
    end

    def update_state_lxc
        @result = HTTParty.put(
            "http://172.28.128.5:9300/api/v1/lxc",
            body: {
              id: params['id'],
              status: params['actionstate']
            }.to_json,
            headers: {
              'Content-Type' => 'application/json',
            }
        )
        redirect_to root_path
    end
end
