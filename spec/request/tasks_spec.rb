# frozen_string_literal: true

RSpec.describe TasksController, type: :request do
  describe 'PUT /tasks/:id/status' do
    subject { put '/tasks/1/status', params: { task: { status: 'doing' } } }
    context '保存済みのタスクのステータスを更新する場合' do
      before do
        use_case = TasksUseCases::Create.new
        use_case.create_task(name: 'test-保存済みのタスクのステータスを更新する場合')
      end
      it 'タスクのステータスが Doing になっていること' do
        subject
        expect(response.status).to eq 200
        json = JSON.parse(response.body)
        expect('Doing').to eq json['task']['status']
      end
    end

    context '存在しないタスクのステータスを更新した場合' do
      it 'status 404を返すこと' do
        subject
        expect(response.status).to eq 404
      end
    end
  end
end
