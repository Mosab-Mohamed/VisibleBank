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
  
  def balance
    account = Account.find params[:id]
    @balance = account.balance
  end
  
  def transfer
    transaction = Transaction.new(transaction_params.merge({
      from_account_id: params[:id],
      transaction_type: Transaction.transaction_types[:transfer]
    }))

    if transaction.save
      render 'api/v1/shared/empty', status: :ok
    else
      @message = transaction.errors
      render_unprocessable
    end
  end

  def transactions
    @transactions = Transaction
                      .where(to_account: params[:id]).or(Transaction.where(from_account: params[:id]))
                      .paginate(page: params[:page], per_page: params[:per_page])
  end

  private
  
  def account_params
    params.require(:account).permit(:customer_id, :currency_id, :account_type, :balance, :number, :status)
  end

  def transaction_params
    params.require(:transaction).permit(:to_account_id, :from_account_id, :amount, :description)
  end
end
