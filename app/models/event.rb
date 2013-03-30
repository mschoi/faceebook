class Event < ActiveRecord::Base
  attr_accessible :description, :end_datetime, :name, :start_datetime, :user_id

  # Relationships
  # ----------------
  belongs_to :user
end
