require "administrate/base_dashboard"

class UserDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    user_libraries: Field::HasMany,
    discs: Field::HasMany,
    deals_sender: Field::HasMany.with_options(class_name: "Deal"),
    deals_receiver: Field::HasMany.with_options(class_name: "Deal"),
    pm_authors: Field::HasMany.with_options(class_name: "DealPm"),
    articles: Field::HasMany,
    comments_receiver: Field::HasMany.with_options(class_name: "Comment"),
    comments_sender: Field::HasMany.with_options(class_name: "Comment"),
    id: Field::Number,
    first_name: Field::String,
    last_name: Field::String,
    address: Field::String,
    additional_address: Field::String,
    zipcode: Field::String,
    city: Field::String,
    country: Field::String,
    description: Field::Text,
    email: Field::String,
    encrypted_password: Field::String,
    reset_password_sent_at: Field::DateTime,
    remember_created_at: Field::DateTime,
    created_at: Field::DateTime,
    updated_at: Field::DateTime,
    completed: Field::Boolean,
  }.freeze

  # COLLECTION_ATTRIBUTES
  # an array of attributes that will be displayed on the model's index page.
  #
  # By default, it's limited to four items to reduce clutter on index pages.
  # Feel free to add, remove, or rearrange items.
  COLLECTION_ATTRIBUTES = %i[
  user_libraries
  discs
  deals_sender
  deals_receiver
  ].freeze

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = %i[
  user_libraries
  discs
  deals_sender
  deals_receiver
  pm_authors
  articles
  comments_receiver
  comments_sender
  id
  first_name
  last_name
  address
  additional_address
  zipcode
  city
  country
  description
  email
  encrypted_password
  reset_password_sent_at
  remember_created_at
  created_at
  updated_at
  completed
  ].freeze

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = %i[
  user_libraries
  discs
  deals_sender
  deals_receiver
  pm_authors
  articles
  comments_receiver
  comments_sender
  first_name
  last_name
  address
  additional_address
  zipcode
  city
  country
  description
  email
  encrypted_password
  reset_password_sent_at
  remember_created_at
  completed
  ].freeze

  # COLLECTION_FILTERS
  # a hash that defines filters that can be used while searching via the search
  # field of the dashboard.
  #
  # For example to add an option to search for open resources by typing "open:"
  # in the search field:
  #
  #   COLLECTION_FILTERS = {
  #     open: ->(resources) { resources.where(open: true) }
  #   }.freeze
  COLLECTION_FILTERS = {}.freeze

  # Overwrite this method to customize how users are displayed
  # across all pages of the admin dashboard.
  #
  # def display_resource(user)
  #   "User ##{user.id}"
  # end
end
