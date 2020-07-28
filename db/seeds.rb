if Rails.env.development?
  %w[admin professor].each do |role|
    Student.create!(
      email: "#{role}@example.com",
      role: role
    )
  end

  10.times do |i|
    Student.create!(
      role: :student,
      email: "student#{i + 1}@example.com"
    )
  end

  %w[Ruby Elixir Go JavaScript TypeScript].each do |language|
    Course.create!(
      name: language,
      data: "Язык программирования #{language}"
    )
  end

  ruby_course = Course.find_by(name: 'Ruby')
  elixir_course = Course.find_by(name: 'Elixir')
  js_course = Course.find_by(name: 'JavaScript')
  go_course = Course.find_by(name: 'Go')
  ts_course = Course.find_by(name: 'TypeScript')

  ruby_past_group = Group.create!(
    course: ruby_course,
    start_date: '01-01-2019',
    finish_date: '01-02-2019'
  )
  ruby_current_group = Group.create!(
    course: ruby_course,
    start_date: '01-12-2019',
    finish_date: '01-02-2020'
  )
  ruby_future_group_march = Group.create!(
    course: ruby_course,
    start_date: '01-03-2020',
    finish_date: '01-06-2020'
  )
  ruby_future_group_may = Group.create!(
    course: ruby_course,
    start_date: '01-05-2020',
    finish_date: '01-08-2020'
  )
  elixir_past_group = Group.create!(
    course: elixir_course,
    start_date: '01-02-2019',
    finish_date: '01-05-2019'
  )
  elixir_future_group = Group.create!(
    course: elixir_course,
    start_date: '01-05-2020',
    finish_date: '01-07-2020'
  )
  go_group = Group.create!(
    course: go_course,
    start_date: '01-08-2020',
    finish_date: '01-10-2020'
  )
  js_group = Group.create!(
    course: js_course,
    start_date: '01-03-2019',
    finish_date: '01-04-2019'
  )
  ts_group = Group.create!(
    course: ts_course,
    start_date: '01-11-2019',
    finish_date: '01-12-2019'
  )

  UserGroup.create!(group: ruby_past_group, student: Student.find_by(email: 'student1@example.com'))
  UserGroup.create!(group: ruby_current_group, student: Student.find_by(email: 'student2@example.com'))
  UserGroup.create!(group: ruby_current_group, student: Student.find_by(email: 'student3@example.com'))
  UserGroup.create!(group: ruby_future_group_march, student: Student.find_by(email: 'student4@example.com'))
  UserGroup.create!(group: ruby_future_group_march, student: Student.find_by(email: 'student5@example.com'))
  UserGroup.create!(group: ruby_future_group_march, student: Student.find_by(email: 'student9@example.com'))
  UserGroup.create!(group: ruby_future_group_may, student: Student.find_by(email: 'student10@example.com'))
  UserGroup.create!(group: elixir_past_group, student: Student.find_by(email: 'student6@example.com'))
  UserGroup.create!(group: elixir_future_group, student: Student.find_by(email: 'student5@example.com'))
  UserGroup.create!(group: elixir_future_group, student: Student.find_by(email: 'student7@example.com'))
  UserGroup.create!(group: go_group, student: Student.find_by(email: 'student5@example.com'))
  UserGroup.create!(group: go_group, student: Student.find_by(email: 'student8@example.com'))
  UserGroup.create!(group: go_group, student: Student.find_by(email: 'student9@example.com'))
  UserGroup.create!(group: js_group, student: Student.find_by(email: 'student10@example.com'))
  UserGroup.create!(group: js_group, student: Student.find_by(email: 'student10@example.com'))
  UserGroup.create!(group: ts_group, student: Student.find_by(email: 'student10@example.com'))
end