require 'rails_helper'

describe User do
  let(:user) { create(:user) }
  let(:post) { create(:post) }
  let(:rate) { rand(-1..1) }

  context 'when pressed favorite button' do
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

  context 'when user votes post' do
    specify 'skip or vote up/down' do
      user.rate_post(post, rate)

      expect(user.post_votes.map(&:rate)).to eq([rate])
    end

    it "does not vote if user already voted" do
      create(:post_vote, user: user, post: post, rate: rate)
      user.rate_post(post, rate)

      expect(user.post_votes.size).to be(1)
    end

    specify 'several users voted' do
      3.times do
        create(:post_vote, post: post, rate: rate)
      end

      expect(post.user_votes.size).to eq(3)
    end
  end
end
