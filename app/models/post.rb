# == Schema Information
#
# Table name: posts
#
#  id           :integer          not null, primary key
#  title        :string
#  content_md   :text
#  content_html :text
#  draft        :boolean          default("false")
#  user_id      :integer
#  slug         :string
#  created_at   :datetime
#  updated_at   :datetime
#
# Indexes
#
#  index_posts_on_user_id  (user_id)
#

class Post < ActiveRecord::Base
  # Use friendly_id
  extend FriendlyId
  friendly_id :title, use: :slugged
  
  # Markdown
  before_save { Markdown.update_html(self) }
    
  # Validations
  validates :title, presence: true, length: { maximum: 100 }, uniqueness: true
  validates :content_md, presence: true
  
  # Pagination
  paginates_per 30  
  
  # Relations
  belongs_to :user
  
  # Scopes  
  scope :published, lambda {
    where(draft: false)
    .order("updated_at DESC")
  }
  
  scope :drafted, lambda {
    where(draft: true)
    .order("updated_at DESC")
  }
  
end
