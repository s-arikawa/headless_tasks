# frozen_string_literal: true

RSpec.describe 'TasksUseCases::Patch' do
  let(:sut) { TasksUseCases::Patch.new }
  describe 'change_status_to_doing' do
    subject { sut.change_status_to_doing(task.id) }
    let!(:task) do
      use_case = TasksUseCases::Create.new
      use_case.create_task(name: 'test-change_status_to_doing')
    end
    it 'ステータスが Doing になっていること' do
      subject
      saved_task = Task.find(task.id)
      expect(saved_task.status).to eq Task::DOING
    end
  end
end
