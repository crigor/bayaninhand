class Comment < ActiveRecord::Base
  include ActsAsCommentable::Comment
  belongs_to :commentable, :polymorphic => true
  default_scope :order => 'created_at DESC'
  belongs_to :user
end
