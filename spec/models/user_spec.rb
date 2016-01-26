require 'rails_helper'

describe User do
  context 'when pressed favorite button' do
    let(:user) { create(:user) }
    let(:post) { create(:post) }

    it 'drops favorite posts' do
      user.favorite_posts = [post.id]
      user.drop_favorites(post)

      expect(user.favorite_posts).to eq([])
    end

    it 'adds favorite posts' do
      user.favorite_posts = []
      user.add_favorites(post)

      expect(user.favorite_posts).not_to be_empty
    end

    it 'checks if post are included' do
      user.favorite_posts = [post.id]
      included = user.included_in_favorites?(post)

      expect(included).to be(true)
    end
  end
end
