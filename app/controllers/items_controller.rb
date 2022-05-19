class ItemsController < ApplicationController
  before_action :basic_auth


  private

  def basic_auth
    authenticate_or_request_with_http_basic do |username,password|
      username == 'matsur2' && password == '2150'
    end
  end

end
