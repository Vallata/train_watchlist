class ListPolicy < ApplicationPolicy
  class Scope < Scope
    # NOTE: Be explicit about which records you allow access to!
    def resolve
      # scope.all
      scope.where(user: user)
    end
  end

  # en modifiant create, new hérite d'update (application policy.rb). Pas besoin de l'ajouter
  def create?
    true
  end

  def show?
    true
  end

  # en modifiant update, edit hérite d'update (application policy.rb). Pas besoin de l'ajouter
  def update?
    true
  end
end
