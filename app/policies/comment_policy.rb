class CommentPolicy < ApplicationPolicy
  attr_accessor :user, :comment

  # self::Scope = Struct.new(:user, :scope) do
  #   def resolve
  #     if @user.nil?
  #       scope.where(approved: true)
  #     elsif @user.author? || @user.editor?
  #       scope.all
  #     else
  #       raise Pundit::NotAuthorizedError
  #     end
  #   end
  # end

  def initialize(user, comment)
    @user = user
    @comment = comment
  end

  def resolve
    scope
  end

  # def show?
  #   @user.editor || @user.author? || @comment.approved?
  # end

  def approve?
    if @user.nil? || @user.twitter_user?
      false
    else
      @user.author? || @user.editor?
    end
  end

  def create?
    if @user.nil?
      false
    else
      @user.twitter_user?
    end
  end

  def destroy?
    approve?
  end
end
