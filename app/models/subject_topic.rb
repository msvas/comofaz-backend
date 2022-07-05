# frozen_string_literal: true

class SubjectTopic < ActiveRecord::Base
  has_many :instructor_subject_topics
  has_many :instructors, through: :instructor_subject_topics

  has_many :questions

  belongs_to :subject_area
end
