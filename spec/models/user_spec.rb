RSpec.describe User, type: :model do
  it "nameが空ならバリデーションが通らない" do
    user = User.new(name: '', email: 'aaa@example.com', password: 'password')
    expect(user).not_to be_valid
  end

  it "emailに@がなければバリデーションが通らない" do
    user = User.new(name: 'user_a', email: 'aaa', password: 'password')
    expect(user).not_to be_valid
  end

  it "emailが空ならばバリデーションが通らない" do
    user = User.new(name: 'user_a', email: '', password: 'password')
    expect(user).not_to be_valid
  end

  it "passwordが空ならばバリデーションが通らない" do
    user = User.new(name: 'user_a', email: 'aaa@example.com', password: '')
    expect(user).not_to be_valid
  end
end
