class Admin::CustomersController < Admin::ApplicationController
  before_action :set_customer, only: [
                             :show,
                             :edit,
                             :update,
                             :destroy
                         ]

  respond_to :html
  def index
    @customers = Customer.search_and_order(params[:search], params[:page])
  end

  def show
    redirect_to edit_admin_customer_path(params[:id])
  end

  def edit
  end

  def add_phone
    @customer.phones.create(number: customer_params[:phone_number])
  end

  def update
    new_params = customer_params.dup
    @customer.update_attributes(new_params)
    @customer.emails.create(address: new_params[:email]) if new_params[:email]
    @customer.phones.create(number: new_params[:phone_number]) if new_params[:phone_number]
    if @customer.valid?
      @customer.save
      respond_with(@customer, notice: "#{@customer.email} updated.")
    else
      flash[:alert] = "couldn't be updated."
      render :edit
    end
  end


  private

  def set_customer
    @customer = Customer.find(params[:id])
    @emails = @customer.emails
    @phones = @customer.phones
  rescue
    flash[:alert] = "The customer with an id of #{params[:id]} doesn't exist."
    redirect_to admin_customers_path
  end

  def customer_params
    params.require(:customer).permit(
        :email,
        :admin,
        :first_name,
        :last_name,
        {phones: [:number]},
        {emails: [:address]}
    )
  end


end
