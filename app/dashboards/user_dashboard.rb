require "administrate/base_dashboard"

class UserDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    posts: Field::HasMany,
    comments: Field::HasMany,
    id: Field::Number,
    first_name: Field::String,
    last_name: Field::String,
    birth_date: Field::DateTime,
    email: Field::String,
    crypted_password: Field::String,
    salt: Field::String,
    login_count: Field::Number,
    is_active: Field::Boolean,
    created_at: Field::DateTime,
    updated_at: Field::DateTime,
    remember_me_token: Field::String,
    remember_me_token_expires_at: Field::DateTime,
    activation_state: Field::String,
    activation_token: Field::String,
    activation_token_expires_at: Field::DateTime,
    is_admin: Field::Boolean,
  }

  # COLLECTION_ATTRIBUTES
  # an array of attributes that will be displayed on the model's index page.
  #
  # By default, it's limited to four items to reduce clutter on index pages.
  # Feel free to add, remove, or rearrange items.
  COLLECTION_ATTRIBUTES = [
    :posts,
    :comments,
    :id,
    :first_name,
  ]

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = ATTRIBUTE_TYPES.keys

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = [
    :posts,
    :comments,
    :first_name,
    :last_name,
    :birth_date,
    :email,
    :crypted_password,
    :salt,
    :login_count,
    :is_active,
    :remember_me_token,
    :remember_me_token_expires_at,
    :activation_state,
    :activation_token,
    :activation_token_expires_at,
    :is_admin,
  ]

  # Overwrite this method to customize how users are displayed
  # across all pages of the admin dashboard.
  #
  # def display_resource(user)
  #   "User ##{user.id}"
  # end
end
