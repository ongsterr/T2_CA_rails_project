class ProfilePolicy < ApplicationPolicy
    def index?
        user.present?
    end

    def show?
        user.present?
    end

    def create?
        user.present?
    end

    def update?
        return true if user.present? && user == profile.user
    end

    def edit?
        return true if user.present? && user == profile.user
    end

    def destroy?
        return true if user.present? && user == profile.user
    end

    private
        def profile
            record
        end
end