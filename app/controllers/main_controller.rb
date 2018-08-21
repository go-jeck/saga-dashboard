require 'httparty'

class MainController < ApplicationController
  def index
    response = HTTParty.get(
      "http://172.28.128.5:9300/api/v1/lxc",
      :headers => {
        "Content-Type" => "application/json"
      }
    )

    @lxclist = JSON.parse(response.body)
  end
end
