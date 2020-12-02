class UserLibrary < ApplicationRecord
belongs_to :user
belongs_to :disc
belongs_to :disc_state

has_many :sender_libraries, class_name: "DealContent", foreign_key: "sender_library_id"
has_many :receiver_libraries, class_name: "DealContent", foreign_key: "receiver_library_id"


validates :user, presence: true
validates :disc, presence: true
validates :disc_state, presence: true
validates :description, length: { in: 4..240 }


end
