module Pheidi
  class Configuration
    attr_accessor :user_class, :policy_class

    def initialize
      @user_class = "User"
      @policy_class = "Pheidi::BasePolicy"
    end
  end
end
