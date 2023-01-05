class Userexecutor < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  scope :all_except, -> (userexecutor) {where.not(id: userexecutor)}
  after_create_commit {broadcast_append_to "userexecutors" }
  has_many :messages

  pay_customer stripe_attributes: :stripe_attributes

  has_one_attached :avatar

  after_commit :add_default_avatar, on: %i[create update]

  validates :email, presence: { message: 'не может быть пустым' },
                    uniqueness: { message: 'такой аккаунт уже зарегистрирован' }

  def avatar_thumbnail
    avatar.variant(resize_to_limit: [150, 150]).processed
  end

  def chat_avatar
    avatar.variant(resize_to_limit: [50, 50]).processed
  end



  def stripe_attributes(pay_customer)
    {
      address: {
        city: pay_customer.owner.city,
        country: pay_customer.owner.country
      },
      metadata: {
        pay_customer_id: pay_customer.id,
        userexecutor_id: id # or pay_customer.owner_id
      }
    }
  end


  def self.search(params)
    if params[:query].blank?
      none
    else
      where(
        'full_name LIKE ?', "%#{sanitize_sql_like(params[:query])}%"
      )
    end
  end

  def self.search2(params)
    if params[:query2].blank?
      none
    else
      where('free_date LIKE ?', params[:query2])
    end
  end

  def self.search3(params)
    if params[:query3].blank?
      none
    else
      where('fee < ?', params[:query3])
    end
  end


  def self.search4(params)
    if params[:category1].blank?
      none
    else
      where('category LIKE ?', params[:category1])
    end
  end









  private

  def add_default_avatar
    return if avatar.attached?

    avatar.attach(
      io: File.open(Rails.root.join('app', 'assets', 'images', 'default_profile.jpg')),
      filename: 'default_profile.jpg',
      content_type: 'image/jpg'
    )
  end







end
