require 'httparty'

class MainController < ApplicationController
  def index
    response = HTTParty.get(
      "#{Rails.application.config.scheduler_address}/lxc",
      :headers => {
        "Content-Type" => "application/json"
      }
    )

    @lxclist = JSON.parse(response.body)
  end
end
