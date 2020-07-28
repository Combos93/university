class CoursesController < ApplicationController
  def index
    @courses = if params[:sort] == 'by_date'
                 Course.sort_by_start_date
               else
                 Course.sort_by_name
               end
  end

  def show
    @course = Course.includes(groups: :students).find(params[:id])
  end
end
