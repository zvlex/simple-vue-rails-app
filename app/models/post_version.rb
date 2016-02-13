class PostVersion < ActiveRecord::Base
  include AASM

  STATES_LIST = [:draft, :on_moderation, :declined, :approved]

  belongs_to :user
  has_one :post

  validates :title, :body, presence: true
  validates :title, length: { in: 5..140 }
  validates :body, length: { minimum: 7 }
  validates :decline_reason, presence: true, if: :declined?

  STATES_LIST.each do |state|
    scope state, -> { where(aasm_state: state).order(created_at: :desc) }
  end

  scope :with_state, -> (name) { where(aasm_state: name) }

  aasm do
    state :draft, initial: true
    state :on_moderation
    state :declined
    state :approved

    event :send_to_moderation do
      transitions from: :draft, to: :on_moderation
    end

    event :decline do
      transitions from: :on_moderation, to: :declined
    end

    event :approve do
      success do
        create_or_update_post!
      end

      transitions from: :on_moderation, to: :approved
    end
  end

  def create_new_post_version!(params)
    params.merge!(inherit_version_id: self.id) if self.approved?

    self.user.post_versions.create!(params)
  end

  def update_current_post_version!(params)
    self.update!(params)
  end

  def update_or_create_post_version!(params)
    if self.draft?
      update_current_post_version!(params)
    else
      create_new_post_version!(params)
    end
  end

  def create_or_update_post!
    if self.inherit_version_id > 0
      post = self.user.posts.find_by(post_version: self.inherit_version_id)
      post.update!(post_version: self)
    else
      self.user.posts.create!(post_version: self)
    end
  end
end
