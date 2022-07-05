# frozen_string_literal: true

class Subject < ActiveRecord::Base
  has_many :subject_areas
end
