# frozen_string_literal: true

class Question < ActiveRecord::Base
  belongs_to :user
  belongs_to :subject_topic

  has_many :question_instructors
  has_many :instructors, through: :question_instructors

  validates :description, presence: true

  enum status: {
    'Criada': 0,
    'Respondida': 1,
    'Finalizada': 2,
    'Arquivada': 3
  }

  def match_instructors
    instructors = Instructor.joins(:instructor_subject_topics)
                            .where(instructor_subject_topics: { subject_topic_id: self.subject_topic.id })
                            .limit(5)
                            .distinct

    instructors.each do |instructor|
      self.instructors << instructor
    end
  end
end
