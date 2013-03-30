class User < ActiveRecord::Base
  attr_accessible :birthday, :email, :first_name, :gender, :last_name, :password, :username

  has_many :posts, foreign_key: 'author_id'
  has_many :events

  def name
    "#{first_name} #{last_name}"
  end

  def name_proper
    [last_name, first_name].join(', ')
  end
end
