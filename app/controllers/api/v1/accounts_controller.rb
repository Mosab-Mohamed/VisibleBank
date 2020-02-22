class Api::V1::AccountsController < Api::V1::BaseController
  def index
    @accounts = Account.paginate(page: params[:page], per_page: params[:per_page])
  end

  def show
    @account = Account.find params[:id]
  end

  def create
    @account = Account.new(account_params)
    if !@account.save
        @message = @account.errors
        render_unprocessable
    end
  end

  def update
    @account = Account.find params[:id]
    if !@account.update(account_params)
      @message = @account.errors
      render_unprocessable
    end
  end

  private

  def account_params
      params.require(:account).permit(:customer_id, :currency_id, :account_type, :balance, :number, :status)
  end
end
