class PagesController < ApplicationController
  before_action :authenticate_user!, only: [
                                       :inside
                                   ]

  def home
  end

  def inside
  end

  def mission
    render 'mission_statement'
  end

  def posts
    @posts = Post.published.page(params[:page]).per(10)
  end

  def show_post
    @post = Post.friendly.find(params[:id])
  rescue
    redirect_to root_path
  end


  def email
    @name = params[:name]
    @email = params[:email]
    @phone = params[:phone]
    @message = params[:message]
    unless mobile? || %W(test development).include?(Rails.env)
      unless verify_recaptcha(model: @posts)
        render "contact" and return
      end
    end

    if @name.blank?
      flash[:alert] = "Please enter your name before sending your message. Thank you."
      render :contact
    elsif @phone.blank? || @phone.length < 10
      flash[:alert] = "We need a phone number to contact you"
      render :contact
    elsif !@email.blank? && @email.scan(/\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i).size < 1
      unless @phone
        flash[:alert] = "You must provide a valid email address before sending your message. Thank you."
        render :contact
      end
    elsif @message.blank? || @message.length < 10
      flash[:alert] = "Your message is empty. Requires at least 10 characters. Nothing to send."
      render :contact
    elsif @message.scan(/<a href=/).size > 0 || @message.scan(/\[url=/).size > 0 || @message.scan(/\[link=/).size > 0 || @message.scan(/http:\/\//).size > 0
      flash[:alert] = "You can't send links. Thank you for your understanding."
      render :contact
    else
      CustomerService.execute(params)
      redirect_to root_path, notice: "Your message was sent. Thank you."
    end
  end

end
