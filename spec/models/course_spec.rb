# == Schema Information
#
# Table name: courses
#
#  id          :bigint           not null, primary key
#  description :text
#  name        :text             not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

require 'rails_helper'

RSpec.describe Course, type: :model do
  let(:course_a) { create :course, name: 'A' }
  let(:course_b) { create :course, name: 'B' }
  let!(:group_a) { create :group, :past_group, course: course_a }
  let!(:group_b) { create :group, :future_group, course: course_b }
  let(:student) { create :student }
  let!(:user_group) { create :user_group, student: student, group: group_b }

  it do
    should have_many(:groups)
  end

  it 'response to sorted_by_name' do
    expect(described_class.sort_by_name).to eq [course_a, course_b]
  end

  it 'response to sorted_by_date_start' do
    expect(described_class.sort_by_start_date).to match_array [course_b]
  end

  it 'response to upcoming_group' do
    expect(course_b.new_group).to eq group_b
  end
end
