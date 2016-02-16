require 'rails_helper'

describe Post do
  USERS_QUANTITY = 3

  let(:post) { create(:post) }
  let(:rand_array) { [-1, 0, 1, 1, 0, 1, -1] }

  it "selects post's favorites quantity" do
    USERS_QUANTITY.times do
      user = create(:user)
      user.add_or_drop_favorites!(post)
    end

    expect(post.favorites_quantity).to eq(3)
  end

  it 'counts post rating quantity' do
    rand_array.size.times do |num|
      user = create(:user)
      user.rate_post(post, rand_array[num])
    end

    array_quantity = rand_array.sum

    expect(post.rating_quantity).to eq(array_quantity)
  end
end
