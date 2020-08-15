# frozen_string_literal: true

# note model
class Note < ActiveRecord::Base
  belongs_to :user
  validates_presence_of :title, on: :create
  validates_presence_of :body, on: :create
end
