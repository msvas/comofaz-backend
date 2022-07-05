# frozen_string_literal: true

class Instructor < ActiveRecord::Base
  belongs_to :user

  has_many :question_instructors
  has_many :questions, through: :question_instructors

  has_many :instructor_subject_topics
  has_many :subject_topics, through: :instructor_subject_topics

  enum status: {
    'Registrado': 0,
    'Em teste': 1,
    'Ativo': 2,
    'Suspenso': 3,
    'Deletado': 4
  }

end
