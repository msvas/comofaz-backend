# frozen_string_literal: true

class Chat < ActiveRecord::Base
  belongs_to :question_instructor

  enum status: {
    'Iniciado': 0,
    'Encerrado': 1,
  }
  
end
