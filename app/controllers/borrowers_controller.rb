# author : Binh Nguyen
class BorrowersController < ApplicationController
  # create underwriting for borrower
  def create
    @borrower = Borrower.new(borrower_params)
    if @borrower.save
      render json: @borrower, status: :created
    else
      render json: { errors: @borrower.errors }, status: :unprocessable_entity
    end
  end

  def index
    render json: { borrowers: Borrower.all }, status: :ok
  end

  private

  def borrower_params
    params.require(:borrower).permit(:first_name, :last_name, :email,
                                     :credit_score, :base_income, :rental_income, :commission,
                                     :full_address, :mortgage_payment,
                                     :mortgage_insurance, :homeowner_insurance, :property_tax, :HOA_due, :property_type_id)
  end
end
