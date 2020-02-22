class Api::V1::CustomersController < Api::V1::BaseController
  def index
    @customers = Customer.paginate(page: params[:page], per_page: params[:per_page])
  end

  def show
    @customer = Customer.find params[:id]
  end

  def create
    @customer = Customer.new(customer_params)
    if !@customer.save
        @message = @customer.errors
        render_unprocessable
    end
  end

  def update
    @customer = Customer.find params[:id]
    if !@customer.update(customer_params)
      @message = @customer.errors
      render_unprocessable
    end
  end

  def accounts
    customer = Customer.find params[:id]
    @accounts = customer.accounts
    render template: 'api/v1/accounts/index'
  end

  private

  def customer_params
      params.require(:customer).permit(:name, :address, :phone, :email, :status)
  end
end
