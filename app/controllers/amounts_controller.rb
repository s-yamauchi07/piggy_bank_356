class AmountsController < ApplicationController
  def index
    amounts = Amount.find_by(params[:user_id])
    render json: amounts
  end

  def create
    saving = Saving.find_by(user_id: params[:user_id], save_amount: params[:save_amount])
    if saving.present?
      saving.destroy
    else
      Saving.create(saving_amount_params)
    end

    amount = Amount.find_by(user_id: params[:user_id])
    if amount.present?
      amount.update(total_amount_params)
    else
      Amount.create(total_amount_params)
    end
  end

  private
  def total_amount_params
    params.permit(:total_amount, :user_id)
  end

  def saving_amount_params
    params.permit(:save_amount, :checked, :user_id)
  end
end