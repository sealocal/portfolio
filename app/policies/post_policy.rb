class PostPolicy < ApplicationPolicy
  attr_accessor :user, :post

  def initialize(user, post)
    @user = user
    @post = post
  end

  def index?
    if @user.nil?
      false
    else
      @user.editor? || @user.admin?
    end
  end

  def resolve
    scope
  end

  def update?
    @user.author? || @user.editor?
  end

  def destroy?
    @user.editor?
  end

  def publish?
    @user.editor?
  end
end
