class AmountsController < ApplicationController
  def index
    user = User.find(params[:user_id])
    amount = user.amount
    is_checked = user.savings
    render json: {amount: amount, is_checked: is_checked}
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

  def destroy
    user = User.find(params[:user_id])
    user.amount.destroy
    user.savings.destroy_all
  end

  private
  def total_amount_params
    params.permit(:total_amount, :user_id)
  end

  def saving_amount_params
    params.permit(:save_amount, :checked, :user_id)
  end
end