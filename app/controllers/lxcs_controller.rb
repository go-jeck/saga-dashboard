require 'httparty'

class LxcsController < ApplicationController
    def new_lxc_form

    end

    def store_new_lxc
        @result = HTTParty.post(
            "http://172.28.128.5:9300/api/v1/container",
            body: {
              name: params['name'],
              type: params['type'],
              protocol: params['protocol'],
              server: params['server'],
              alias: params['alias']
            }.to_json,
            headers: {
              'Content-Type' => 'application/json',
            }
        )
    end

    def update_state_lxc
        @result = HTTParty.post(
            "http://172.28.128.5:9300/api/v1/container/updatestate",
            body: {
              id: params['id'],
              name: params['name'], 
              state: {
                action: params['actionstate'], 
                timeout: 60
              }
            }.to_json,
            headers: {
              'Content-Type' => 'application/json',
            }
        )
        redirect_to root_path
    end

    def delete_lxc
        @result = HTTParty.delete(
            "http://172.28.128.5:9300/api/v1/container",
            body: {
              id: params['id']
            }.to_json,
            headers: {
              'Content-Type' => 'application/json',
            }
        )
        redirect_to root_path
    end
end
