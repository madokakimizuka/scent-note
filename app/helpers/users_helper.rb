module UsersHelper
  def admin_required
      redirect_to user_path(current_user.id), notice: '管理者しかアクセスできません' unless current_user.admin?
  end
end
