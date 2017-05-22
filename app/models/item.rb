class Item < ActiveRecord::Base
   belongs_to :drone
   validates :name, presence: true, length: {minimum: 3, maximum: 50}
   validates :description, presence: true, length: {minimum: 10, maximum: 300}
   validates :drone_id, presence: true
   end
