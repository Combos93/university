class UserGroupsController < ApplicationController
  def create
    student = Student.find_by(email: email_params) || Student.new(student_params(email_params))
    unless student.valid?
      go_to_course
      return
    end

    student.save!
    UserGroup.create!(student: student)
    go_to_course
  end

  private

  def go_to_course
    redirect_to course_path(id: find_group.course_id)
  end

  def student_params(email)
    param_email = params[:user_group][:email]

    {
      role: param_email,
      email: email
    }
  end

  def email_params
    params[:user_group][:email]
  end

  def find_group
    Group.find(params[:group_id])
  end
end
