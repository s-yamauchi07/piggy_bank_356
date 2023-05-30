class CalendarsController < ApplicationController
  def index
    user = User.find(params[:user_id])
    saving_date = user.savings
    render json: saving_date
  end
end
