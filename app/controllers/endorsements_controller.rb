class EndorsementsController < ApplicationController
  before_action :set_endorsement, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @endorsements = Endorsement.all
    respond_with(@endorsements)
  end

  def show
    respond_with(@endorsement)
  end

  def new
    @endorsement = Endorsement.new
    # @customer = Customer.new
    respond_with(@endorsement)
  end

  def edit
  end

  def create
    xtra_params = endorsement_params.delete(:xtra)
    @endorsement = Endorsement.new(endorsement: endorsement_params[:endorsement])
    if @endorsement.endorsement.blank? || @endorsement.endorsement.length < 10
      flash[:alert] = "Your message is empty. Requires at least 10 characters. Nothing to send."
      render :new && return
    end
    unless mobile? || %W(test development).include?(Rails.env)
      v = verify_recaptcha(@endorsement)
      unless v
        flash[:error] = flash.delete(:recaptcha_error)
        render "new" && return
      end
    end
    if (xtra_params[:email][:address].blank? rescue true) && (xtra_params[:email][:address].scan(/\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i).size < 1 rescue true)
      flash[:error] = "Email cannot be blank"
      render :new && return
    end
    flash[:notice] = "Thank you, your endorsement has been submitted."
    EndorsementService.execute(@endorsement, xtra_params)
    redirect_to root_path
  end

  def update
    require_admin!
    @endorsement.update(endorsement_params)
    respond_with(@endorsement)
  end

  def destroy
    require_admin!
    @endorsement.destroy
    respond_with(@endorsement)
  end

  private
  def set_endorsement
    @endorsement = Endorsement.find(params[:id])
  end

  def endorsement_params
    # params.require(:endorsement).permit(:endorsement, :approved, customer: [:name], email: [:address], xtra: [:customer, :email] )
    params.require(:endorsement).permit(:endorsement, :approved, xtra: [customer:[:name], email: [:address], phone: [:number]] )
  end
end
