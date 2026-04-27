module Pheidi
  class Configuration
    attr_accessor :user_class, :policy_class, :database

    def initialize
      @user_class = "User"
      @policy_class = "Pheidi::BasePolicy"
      @database = :pheidi
    end
  end
end
