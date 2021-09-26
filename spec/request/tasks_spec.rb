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

      context '変なステータスに更新しようとした場合' do
        subject { put '/tasks/1/status', params: { task: { status: 'Noting' } } }
        it 'status 400を返すこと' do
          subject
          expect(response.status).to eq 400
        end
      end

      context 'ステータスが空文字の場合' do
        subject { put '/tasks/1/status', params: { task: { status: '' } } }
        it 'status 400を返すこと' do
          subject
          expect(response.status).to eq 400
        end
      end

      context 'ステータスが未指定の場合' do
        subject { put '/tasks/1/status', params: { task: {} } }
        it 'status 400を返すこと' do
          subject
          expect(response.status).to eq 400
        end
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
