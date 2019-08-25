RSpec.describe Task, type: :model do
  before do
    @user = FactoryBot.create(:user)
    # @one = FactoryBot.create(:task, user: @user)
    # @two = FactoryBot.create(:second_task, user: @user)
    # @three = FactoryBot.create(:third_task, user: @user)
  end

  it "titleが空ならバリデーションが通らない" do
    task = Task.new(title: '', content: '失敗テスト')
    expect(task).not_to be_valid
  end
end
