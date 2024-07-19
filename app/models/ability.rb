# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    @roles = {
      author: Author.exists?(user.id),
      subscriber: Subscriber.exists?(user.id),
      admin: user.is_admin?
    }

    if @roles[:author]
      author(user)
    end

    if @roles[:subscriber]
      subscriber(user)
    end

    if @roles[:admin]
      admin(user)
    end

    # Define abilities for the user here. For example:
    #
    #   return unless user.present?
    #   can :read, :all
    #   return unless user.admin?
    #   can :manage, :all
    #
    # The first argument to `can` is the action you are giving the user
    # permission to do.
    # If you pass :manage it will apply to every action. Other common actions
    # here are :read, :create, :update and :destroy.
    #
    # The second argument is the resource the user can perform the action on.
    # If you pass :all it will apply to every resource. Otherwise pass a Ruby
    # class of the resource.
    #
    # The third argument is an optional hash of conditions to further filter the
    # objects.
    # For example, here the user can only update published articles.
    #
    #   can :update, Article, published: true
    #
    # See the wiki for details:
    # https://github.com/CanCanCommunity/cancancan/blob/develop/docs/define_check_abilities.md
  end

  def admin(user)
    can :manage, :all
  end

  def author(user)
    cannot :manage, :all
  end

  def subscriber(user)
    cannot :manage, :all
    can :read, AuthorPost do |author_post|
      user.authors.exists? author_post.author
    end
  end
end