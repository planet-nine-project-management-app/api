class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # Callback to ensure jti is generated for new users
  before_create :generate_jti

  # Generates a JWT with the current `jti` value
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

   # Regenerates the `jti` to invalidate old tokens
   def invalidate_jwt!
    update!(jti: SecureRandom.uuid)
  end

  private

  # Generates a unique `jti` for the user
  def generate_jti
    self.jti ||= SecureRandom.uuid
  end
end
