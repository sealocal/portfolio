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
    if @user.nil?
      false
    else
      @user.author? || @user.editor?
    end
  end

  def destroy?
    approve?
  end
end
