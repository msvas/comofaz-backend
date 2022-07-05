# frozen_string_literal: true

module Api::V1
  class QuestionsController < ApplicationController
    before_action :authenticate_user!

    def index
      questions = Question.where(user_id: current_user.id)
      render json: questions, status: :ok
    end

    def create
      question = Question.create!(user_id: current_user.id,
                                  description: question_params[:description],
                                  subject_topic_id: question_params[:subject_topic_id])
      question.match_instructors
      
      render json: question, status: :created
    end

    def show
      question = Question.find(params[:id])
      render json: question, status: :ok
    end

    private

    def question_params
      params.require(:question).permit(:id, :description, :subject_topic_id)
    end

  end
end
