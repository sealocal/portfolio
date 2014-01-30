class CommentPolicy < ApplicationPolicy
  attr_accessor :user, :comment

  def initialize(user, comment)
    @user = user
    @comment = comment
  end

  def resolve
    scope
  end

  def approve?
    @user.author? || @user.editor?
  end
end
