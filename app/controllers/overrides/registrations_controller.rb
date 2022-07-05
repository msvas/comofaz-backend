module Overrides
  class RegistrationsController < DeviseTokenAuth::RegistrationsController

    protected

    def render_create_success
      # @resource will have been set by set_user_by_token concern
      if params[:is_instructor] && params[:is_instructor] == true
        if params[:subject_topic_ids]
          instructor = Instructor.create!(user_id: @resource.id)
          @resource.update!(is_instructor: true)
          params[:subject_topic_ids].each do |subject_topic_id|
            InstructorSubjectTopic.create!(instructor: instructor, subject_topic_id: subject_topic_id)
          end
        end
        super
      else
        super
      end
    end

  end
end
