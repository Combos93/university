ActiveAdmin.register Group do
  permit_params :course_id, :start_date, :finish_date

  form do |f|
    f.inputs do
      f.input :course
      f.input :start_date, as: :datepicker
      f.input :finish_date, as: :datepicker
    end
    f.actions
  end
end
