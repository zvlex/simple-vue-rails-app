require 'rails_helper'

RSpec.describe PostVersion, type: :model do
  let(:user) { create(:user) }
  let(:post_version) { create(:post_version, user: user) }
  let(:approved_post_version) { create(:approved_post_version) }
  let(:on_moderation_post_version) { create(:on_moderation_post_version) }
  let!(:post) { create(:post, post_version: approved_post_version, user: user) }

  it 'creates new post version draft' do
     expect(post_version.aasm_state).to eq('draft')
  end

  describe '#update' do

    context 'when approved' do
      it 'creates new draft with inherit_version_id' do
        params = { title: 'Lorem Ipsum', body: 'Sed eget vestibulum risus' }
        new_post_version = approved_post_version.update_or_create_post_version!(params)

        expect(new_post_version.inherit_version_id).to eq(approved_post_version.id)
      end
    end

    context 'when is draft' do
      it 'updates current draft' do
        params = { title: 'Lorem Ipsum', body: 'Sed eget vestibulum risus' }
        post_version.update_or_create_post_version!(params)

        expect(post_version.title).to eq('Lorem Ipsum')
      end
    end
  end

  describe '#approve' do
    context 'when admin approves post version' do
      it 'creates post' do
        on_moderation_post_version.approve!

        expect(on_moderation_post_version.post).not_to be_nil
      end

      it 'updates post' do
        new_post_version = create(:on_moderation_post_version, inherit_version_id: approved_post_version.id, user: user)
        new_post_version.approve!
        post.reload

        expect(post.post_version).to eq(new_post_version)
      end
    end
  end
end
