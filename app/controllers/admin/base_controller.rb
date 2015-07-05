class Admin::BaseController < Admin::ApplicationController
  before_filter :require_admin!
  
  def index
    @last_signups = Customer.latest_customers(10)
    @count = Customer.count
    @post_count = Post.count
  end
end
