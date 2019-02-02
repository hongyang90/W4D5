require 'rails_helper'

RSpec.describe User, type: :model do
  subject(:user) { User.new(username: 'pokemon', email: 'poke123@yahoo.com', password: '123456') }
  describe 'validations' do
    it { should validate_presence_of(:username) }
    it { should validate_presence_of(:email) }
    it { should validate_uniqueness_of(:username) }
    it { should validate_length_of(:password).is_at_least(6) }
  end

  describe 'associations' do 
    it { should have_many(:comments) }
    it { should have_many(:goals) }
  end

  describe 'find_by_credentials' do
    it 'should find the correct user' do 
      user2 = User.create!(username: 'Ash', email: 'catchem@all.com', password:'pikapika')

      expect(User.find_by_credentials('Ash', 'pikapika')).to eq(user2)
    end
  end

  describe 'reset_session_token!' do
    it 'resets user\'s session token' do
      user = User.new(username: 'Broke', email: 'broke@back.com', password: 'ilovenursejoy')
      original = user.session_token
      expect(user.reset_session_token!).not_to be(original)
    end
  end

end
