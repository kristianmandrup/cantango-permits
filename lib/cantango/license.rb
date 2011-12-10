module CanTango
  class License
    sweetload :Rules

    include Rules

    attr_reader :ability, :licenses

    def initialize ability
      @ability   = ability
    end

    def calc_rules
    end

    def execute
    end
  end
end