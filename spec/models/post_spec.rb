require 'rails_helper'

describe Post do
  USERS_QUANTITY = 3

  let(:post) { create(:post) }

  it "selects post's favorites quantity" do
    USERS_QUANTITY.times do
      user = create(:user)
      user.add_or_drop_favorites!(post)
    end

    expect(post.favorites_quantity).to eq(3)
  end
end
