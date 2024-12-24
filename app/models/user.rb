class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # -----------------------------------------------
  # RELATIONSHIPS
  # -----------------------------------------------
  has_many :user_projects
  has_many :projects, through: :user_projects
  has_many :deliverables
  has_many :comments
  has_many :roles

  # -----------------------------------------------
  # VALIDATIONS
  # ------------------------------------------------
  validates :name, :email, :role, presence: true
  validates :email, uniqueness: true

  # -----------------------------------------------
  # ENUMS
  # ------------------------------------------------
  enum role: ::USER_ROLES

  # -----------------------------------------------
  # INSTANCE METHODS
  # ------------------------------------------------
  def generate_jwt
    JWT.encode(
      {
        id: id,
        jti: jti,
        exp: 30.days.from_now.to_i
      },
      ENV['SECRET_KEY_BASE']
    )
  end

  def valid_password?(password)
    super || raise(ExceptionHandler::InvalidAccess, 'Invalid email or password')
  end

  def invalidate_jwt!
    update!(jti: SecureRandom.uuid)
  end
end
