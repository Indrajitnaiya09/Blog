class Ability
  include CanCan::Ability

  def initialize(user)
    if user.nil?
        can :read, [Category, Article]
    elsif user.role?"Admin"
        can :manage, [Category, Article, Review]
    elsif user.role?"Moderator"
        can :read, [Category, Article, Review]
        can :create, Review
        can :destroy, Review
    elsif user.role?"Author"
        can :read, [Category, Article, Review]
        can :create, Article 
        can [:update, :destroy], Article do |art|
            art.article.user_id == user.id
        end
        can :destroy, Review do |rev|
            rev.article.user_id == user.id
        end
    elsif user.role?"User"
        can :read, [Category, Article, Review]
        can [:read, :create], Review
        can [:update, :destroy], Review do |review|
            review.user_id == user.id
        end
    end
  end
end
