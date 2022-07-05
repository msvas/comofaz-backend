# frozen_string_literal: true

module Api::V1
  class InstructorsController < ApplicationController
    before_action :authenticate_user!

    private

    def instructor_params
      params.require(:instructor).permit(:email, :password, :subject_topic_ids)
    end

  end
end
