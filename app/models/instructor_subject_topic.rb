# frozen_string_literal: true

class InstructorSubjectTopic < ActiveRecord::Base
  belongs_to :instructor
  belongs_to :subject_topic
end
