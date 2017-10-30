class AuthenticateUser
  prepend SimpleCommand
  def initialize (email,password)
    @email=email
    @password=password
  end

  def call
    token = JsonWebToken.encode(user_id: user.id) if user
    {"token"=>token,"id"=>user.id}
  end


  private
  attr_accessor :email , :password

  def user
    public_user = PublicUser.find_by_email(email)
    return public_user if public_user && public_user.authenticate(password)

    errors.add :user_authentication, 'Invalid credentials'
    nil

  end
end