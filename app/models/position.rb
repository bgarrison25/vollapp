class Position < ActiveRecord::Base
  has_many :user_positions
  has_many :users, :through => :user_positions
end
