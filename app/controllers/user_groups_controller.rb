class UserGroupsController < ApplicationController
  def create
    student = Student.find_by(email: email_params) || Student.new(student_params)
    unless student.valid?
      go_to_course
      return
    end

    student.save!
    UserGroup.create!(student: student, group: find_group)
    go_to_course
  end

  private

  def go_to_course
    redirect_to course_path(id: find_group.course_id)
  end

  def student_params#(email)
    email = params[:user_group][:email]

    {
      role: :student,
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
