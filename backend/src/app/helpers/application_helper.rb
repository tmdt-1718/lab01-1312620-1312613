module ApplicationHelper
  def active_class controller_name, action_name=nil
    is_controller_match = controller.controller_name == controller_name
    is_action_match = controller.action_name == action_name
    is_active = action_name ? is_controller_match && is_action_match : is_controller_match
    is_active ? 'active' : ''
  end

  def authorize_album id
    user = current_user
    album = Album.find id
    album.user == user ? true : false
  end

  def authorize_blog id
    user = current_user
    blog = Article.find id
    blog.user == user ? true : false
  end
end
