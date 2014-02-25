class User
  include Mongoid::Document

  has_many :nuggets
  
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  ## Database authenticatable
  field :email,              :type => String, :default => ""
  field :encrypted_password, :type => String, :default => ""

  ## Recoverable
  field :reset_password_token,   :type => String
  field :reset_password_sent_at, :type => Time

  ## Rememberable
  field :remember_created_at, :type => Time

  ## Trackable
  field :sign_in_count,      :type => Integer, :default => 0
  field :current_sign_in_at, :type => Time
  field :last_sign_in_at,    :type => Time
  field :current_sign_in_ip, :type => String
  field :last_sign_in_ip,    :type => String

  ## Confirmable
  # field :confirmation_token,   :type => String
  # field :confirmed_at,         :type => Time
  # field :confirmation_sent_at, :type => Time
  # field :unconfirmed_email,    :type => String # Only if using reconfirmable

  ## Lockable
  # field :failed_attempts, :type => Integer, :default => 0 # Only if lock strategy is :failed_attempts
  # field :unlock_token,    :type => String # Only if unlock strategy is :email or :both
  # field :locked_at,       :type => Time
  
  field :name, type: String
  field :username, type: String
  field :biography, type: String

  field :nugget_count, type: Integer

  field :admin, type: Boolean
  field :approved, type: Boolean

  scope :admins, ->{ where(admin: true) }
  scope :awaiting_approval, ->{ excludes(approved: true) }
  scope :authors_with_admins_first, ->{ order_by(admin: -1).where(approved: true, ) }

  def moderator?
    true
  end

  def status
    return -1 unless approved
    return 2 if admin
    return 1
  end

  def awaiting_approval?
    true if status == -1
  end
end
