class SessionsController < ApplicationController
  skip_before_action :authenticate, only: [:create]

  # POST /users
  # POST /users.json
  def create
    user = User.find_by_email(params[:email])
    # If the user exists AND the password entered is correct.
    if user && user.authenticate(params[:password])
      user.update(token: user.generate_api_key) if user.token.nil?
      render json: UserSerializer.new(user), status: :ok
    else
      # If user's login doesn't work, send them back to the login form.
      self.headers["WWW-Authenticate"] = %(Token realm="#{realm.gsub(/"/, "")}")
      render json: 'Bad credentials', status: :unauthorized
    end
  end

  # GET /users/1
  # GET /users/1.json
  def destroy
    @current_user.update(token: nil)
    render json: 'Successfully logged out', status: :ok
  end

end
