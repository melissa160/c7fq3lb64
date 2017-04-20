class ExpensesController < ApplicationController
  def index
    @expenses = Expense.order("date DESC")
    if params[:concept].present? && params[:category_id].present?
      @expenses = @expenses.where("concept LIKE ? AND category_id = ?", "%#{params[:concept]}%", params[:category_id])
    elsif params[:concept].present?
      @expenses = @expenses.where("concept LIKE ?", "%#{params[:concept]}%")
    elsif params[:category_id].present?
      @expenses = @expenses.where("category_id = ?", params[:category_id])
    end
  end
end
