class User < ApplicationRecord
  has_secure_password
  has_paper_trail
  acts_as_paranoid

  mount_uploader :avatar, ImageUploader

  # ================Association=====================
  has_many :comments, dependent: :destroy
  has_many :orders, dependent: :destroy
  has_many :votes

  has_one :api_key, dependent: :destroy
  belongs_to :role

  # ================ENUMS=====================
  enum gender: %w[male female other]

  # ================Validates=====================
  validates :email, presence: true
  validates :password_confirmation, presence: true, on: %i[create update],
                                    unless: :skip_password_validation
  validates :email, uniqueness: { scope: :deleted_at }
  validates :password, confirmation: true
  validates :email, format: { with: /\w+@\w+\.{1}[a-zA-Z]{2,}/ }
  validates :phone, format: { with: /(09+([0-9]{8})|01+([0-9]{9}))/ }
  validates_date :birthday, before: -> { 18.years.ago },
                            before_message: I18n.t('user.must_be_greater_than_18')

  # ==============Attr-Accessor===============
  attr_accessor :skip_password_validation

  # ===============Scope======================
  scope :incudes_order, -> { inlcudes(:orders) }

  # format name of user follow company format name (example: Huy Dinh Q.)
  def format_fullname
    mid_name = ''
    if middle_name.present?
      mid_name = middle_name.split(/[\s,　]/)
      mid_name = mid_name.map { |c| "#{c[0]}." if c.present? }
      mid_name = mid_name.join.upcase
    end
    fullname = "#{first_name} #{last_name} #{mid_name}"
    fullname.squish.to_ascii
  end
end
