# frozen_string_literal: true

class SubjectArea < ActiveRecord::Base
  has_many :subject_topics
  belongs_to :subject
end
