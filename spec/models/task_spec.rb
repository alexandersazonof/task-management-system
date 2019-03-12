require 'rails_helper'

RSpec.describe Task do
  let(:user) { User.create(id: 1, email: 'soma@mail.com', password: 'somapassword')}
  let(:task) { Task.create(name: 'somname', user_id: user.id) }

  it "is valid with valid attributes" do
    expect(task.valid?).to eq(true)
  end

  it 'is not valit without name' do
    task.name = nil
    expect(task.valid?).to eq(false)
  end

  it 'is not valid without user id' do
    task.user_id = nil
    expect(task.valid?).to eq(false)
  end

  it 'is shorter than 4' do
    task.name = 'asd'
    expect(task.valid?).to eq(false)
  end

  it 'is longer than 10' do
    task.name = 'qwe'*30
    expect(task.valid?).to eq(false)
  end
end
