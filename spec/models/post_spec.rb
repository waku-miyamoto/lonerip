require 'rails_helper'

describe Post do
  describe '#create' do
    it "titleが空ならNG" do
      post = build(:post, name: nil)
      post.valid?
      expect(post.errors[:name]).to include("を入力してください")
    end
    it "textが空ならNG" do
      post = build(:post, text: nil)
      post.valid?
      expect(post.errors[:text]).to include("を入力してください")
    end
    it "imageが空ならNG" do
      post = build(:post, image: nil)
      post.valid?
      expect(post.errors[:image]).to include("を入力してください")
    end
  end
end