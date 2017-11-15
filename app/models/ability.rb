class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new # guest user (not logged in)
    if user.has_role? :admin
      can :manage, :all
    elsif user.has_role? :talentcouch
      can :manage, ActiveAdmin::Page, name: "Dashboard"
      can :manage, Talent
      cannot [:destroy], Talent

    elsif user.has_role? :consultant
      can :manage, ActiveAdmin::Page, name: "Dashboard"
      can :manage, Talent
      cannot [:new, :create, :destroy], Talent
    else
      cannot User
    end
  end
end
