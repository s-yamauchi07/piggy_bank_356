class AmountsController < ApplicationController
  def create
    amount = Amount.find_by(user_id: params[:user_id])
    if amount.present?
      amount.update(amount_params)
    else
      Amount.create(amount_params)
    end
    head :created
  end

  private
  def amount_params
    params.permit(:total_amount, :user_id)
  end
end