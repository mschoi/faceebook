class Post < ActiveRecord::Base
  attr_accessible :author_id, :content, :posted

  belongs_to :user, foreign_key: 'author_id'
end
