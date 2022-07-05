# frozen_string_literal: true

class QuestionInstructor < ActiveRecord::Base
  belongs_to :instructor
  belongs_to :question
end
