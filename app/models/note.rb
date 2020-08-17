# frozen_string_literal: true

# note model
class Note < ActiveRecord::Base
  belongs_to :user
  validates_presence_of :body, on: %i[create update]
  validates_length_of :title, maximum: 30
  validates_length_of :body, maximum: 1000
end
