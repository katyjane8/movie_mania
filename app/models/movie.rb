class Movie < ApplicationRecord
  validates_presence_of :title, :description, :director_id
  belongs_to :director
end
