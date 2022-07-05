# frozen_string_literal: true

module Api::V1
  class SubjectTopicsController < ApplicationController

    def index
      topics = SubjectTopic.all
      render json: topics, status: :ok
    end

  end
end
