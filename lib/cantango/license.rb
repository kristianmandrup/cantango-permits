module CanTango
  class License
    sweetload :Loader, :Rules

    include Rules
    include Loader

    attr_reader :permit, :licenses

    def initialize permit
      @permit   = permit
    end

    def license_rules
      static_rules
      permit_rules
      dynamic_rules
    end

    def execute
    end
  end
end