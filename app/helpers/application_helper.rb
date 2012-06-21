module ApplicationHelper
  def isLogin?
    session['current_user_id']
  end

  def sign_in(user)
    session['current_user_id'] = user.id
    session['current_user_name'] = user.name
  end
end
