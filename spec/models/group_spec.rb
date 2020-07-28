# == Schema Information
#
# Table name: groups
#
#  id          :bigint           not null, primary key
#  date_finish :date
#  date_start  :date
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  course_id   :bigint
#
# Indexes
#
#  index_groups_on_course_id  (course_id)
#
# Foreign Keys
#
#  fk_rails_...  (course_id => courses.id)
#

require 'rails_helper'

RSpec.describe Group, type: :model do
  let(:course) { create :course }
  let!(:future_group) { create :group, :future_group, course: course }
  let!(:current_group) { create :group, :current_group, course: course }
  let(:past_group) { create :group, :past_group, course: course }
  let(:student) { create :student }
  let!(:user_group_a) { create :user_group, group: past_group, student: student }
  let!(:user_group_b) { create :user_group, group: current_group, student: student }

  describe 'associations' do
    it { should belong_to(:course) }
    it { should have_many(:user_groups) }
    it { should have_many(:students) }
  end

  describe 'validations' do
    it { should validate_presence_of(:finish_date) }
    it { should validate_presence_of(:start_date) }
    it 'validates finish date after start date' do
      group = Group.new(
        course: course,
        start_date: Date.current,
        finish_date: Date.current - 1.day
      )
      group.valid?
      expect(group.errors.messages[:finish_date]).to eq ['must be greater than date_start']
    end
  end

  it 'response to with_students' do
    expect(described_class.with_students).to match_array [past_group, current_group]
  end

  it 'response to future' do
    expect(described_class.group_by_future).to match_array [future_group]
  end

  it 'response to current' do
    expect(described_class.current_group).to match_array [current_group]
  end

  it 'response to past' do
    expect(described_class.group_by_past).to match_array [past_group]
  end

  it 'response to students' do
    expect(past_group.students).to match_array [student]
  end

  it 'response to professors' do
    expect(past_group.students.where(role: :professor)).to eq []
  end
end
