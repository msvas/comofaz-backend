# frozen_string_literal: true

module Api::V1::Instructor
  class QuestionsController < ApplicationController
    before_action :authenticate_user!

    def index
      questions = Question.joins(:question_instructors)
                          .where(question_instructors: { instructor_id: current_user.instructor.id })
                          .distinct

      render json: questions, status: :ok
    end

    private


  end
end
