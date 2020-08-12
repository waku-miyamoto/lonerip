require 'rails_helper'

describe User do
  describe '#create' do
    it "全て入力されていればOK" do
      user = build(:user)
      expect(user).to be_valid
    end
    it "nameが空ならNG" do
      user = build(:user, name: nil)
      user.valid?
      expect(user.errors[:name]).to include("を入力してください")
    end
    it "nameが重複していたらNG" do
      user1 = create(:user)
      expect(build(:user, name: user1.name)).to_not be_valid
    end
    it "emailが空ならNG" do
      user = build(:user, email: nil)
      user.valid?
      expect(user.errors[:email]).to include("を入力してください")
    end
    it "emailが重複していたらNG" do
      user1 = create(:user)
      expect(build(:user, email: user1.email)).to_not be_valid
    end
    it "passwordが空ならNG" do
      user = build(:user, password: nil)
      user.valid?
      expect(user.errors[:password]).to include("を入力してください")
    end
  end
end