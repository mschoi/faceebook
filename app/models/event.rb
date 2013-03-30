class Event < ActiveRecord::Base
  attr_accessible :description, :end_datetime, :name, :start_datetime, :user_id

  belongs_to :usep,
    class_name: 'User',
    foreign_key: 'user_id'
end
