class WelcomeController < ApplicationController
  layout 'adm'

  def index
    @name = params[:name]
  end
end
